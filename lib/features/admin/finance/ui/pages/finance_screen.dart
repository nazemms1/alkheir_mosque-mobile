import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/features/admin/finance/ui/providers/finance_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/finance/domain/entities/finance_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/finance/ui/pages/finance_forms.dart';

enum _FinanceTab { overview, ledger, transfers, exchanges, requests }

/// شاشة المالية: نظرة عامة على الصناديق، والسجل، والتحويلات، والصرف، والطلبات.
/// كل تبويب يظهر فقط إذا كانت صلاحيته موجودة في تسجيل الدخول.
class FinanceScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const FinanceScreen({super.key, required this.token});

  @override
  ConsumerState<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends ConsumerState<FinanceScreen>
    with TickerProviderStateMixin {
  late final _service = ref.read(financeActionsControllerProvider.notifier);
  late final List<_FinanceTab> _tabs;
  late final TabController _tabCtrl;

  /// يتغير عند أي عملية مالية ناجحة فتتحدث كل القوائم معاً.
  int _reloadToken = 0;

  @override
  void initState() {
    super.initState();
    final t = widget.token;
    _tabs = [
      if (ModuleAccess.canViewFinanceSummary(t)) _FinanceTab.overview,
      if (ModuleAccess.canViewCashBoxes(t)) _FinanceTab.ledger,
      if (ModuleAccess.canViewCashBoxes(t)) _FinanceTab.transfers,
      if (ModuleAccess.canViewExchanges(t)) _FinanceTab.exchanges,
      if (ModuleAccess.canViewFinanceRequests(t)) _FinanceTab.requests,
    ];
    _tabCtrl =
        TabController(length: _tabs.isEmpty ? 1 : _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  void _onChanged() => setState(() => _reloadToken++);

  String _tabLabel(_FinanceTab tab) => switch (tab) {
        _FinanceTab.overview => L10nGateway.current.overview,
        _FinanceTab.ledger => L10nGateway.current.ledger,
        _FinanceTab.transfers => L10nGateway.current.transfers,
        _FinanceTab.exchanges => L10nGateway.current.exchange,
        _FinanceTab.requests => L10nGateway.current.requests,
      };

  Widget _buildTab(_FinanceTab tab) {
    switch (tab) {
      case _FinanceTab.overview:
        return _OverviewTab(
          token: widget.token,
          service: _service,
          reloadToken: _reloadToken,
          onChanged: _onChanged,
        );
      case _FinanceTab.ledger:
        return _LedgerTab(
          service: _service,
          reloadToken: _reloadToken,
        );
      case _FinanceTab.transfers:
        return _TransfersTab(service: _service, reloadToken: _reloadToken);
      case _FinanceTab.exchanges:
        return _ExchangesTab(service: _service, reloadToken: _reloadToken);
      case _FinanceTab.requests:
        return _RequestsTab(service: _service, reloadToken: _reloadToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_tabs.isEmpty) {
      return ModuleScaffold(
        title: L10nGateway.current.finance,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.finance,
      bottom: _tabs.length > 1
          ? TabBar(
              controller: _tabCtrl,
              isScrollable: true,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: appTextStyle(fontWeight: FontWeight.w700),
              unselectedLabelStyle: appTextStyle(),
              tabs: [for (final tab in _tabs) Tab(text: _tabLabel(tab))],
            )
          : null,
      body: TabBarView(
        controller: _tabCtrl,
        physics: _tabs.length > 1 ? null : const NeverScrollableScrollPhysics(),
        children: [for (final tab in _tabs) _buildTab(tab)],
      ),
    );
  }
}

// ─── أسماء العرض ───────────────────────────────────────────────────────────────

String requestTypeLabel(String type) => switch (type) {
      'pull' => L10nGateway.current.pullRequest,
      'expense' => L10nGateway.current.expenseRequest,
      'revenue' => L10nGateway.current.revenueRequest,
      'return' => L10nGateway.current.returnRequest,
      _ => type,
    };

String requestStatusLabel(String status) => switch (status) {
      'pending' => L10nGateway.current.pending2,
      'accepted' => L10nGateway.current.accepted,
      'declined' => L10nGateway.current.declined,
      'settled' => L10nGateway.current.settled,
      _ => status,
    };

Color _requestStatusColor(BuildContext context, String status) =>
    switch (status) {
      'pending' => context.appColors.warning,
      'accepted' || 'settled' => context.appColors.success,
      'declined' => context.appColors.error,
      _ => context.appColors.info,
    };

String ledgerTypeLabel(String type) => switch (type) {
      'manual_adjustment' => L10nGateway.current.manualAdjustment,
      'cash_box_transfer' => L10nGateway.current.transferBetweenCashBoxes,
      'currency_exchange' => L10nGateway.current.currencyExchange,
      _ => type.replaceAll('_', ' '),
    };

// ─── نظرة عامة ─────────────────────────────────────────────────────────────────

class _OverviewTab extends ConsumerStatefulWidget {
  final AuthToken token;
  final FinanceActionsController service;
  final int reloadToken;
  final VoidCallback onChanged;

  const _OverviewTab({
    required this.token,
    required this.service,
    required this.reloadToken,
    required this.onChanged,
  });

  @override
  ConsumerState<_OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends ConsumerState<_OverviewTab> {
  late final _loadProvider = screenDataProvider(() async {
    final summary = await ref
        .read(financeActionsControllerProvider.notifier)
        .query((r) => r.summary());
    return summary;
  });
  FinanceSummary? get _summary => ref.watch(_loadProvider).valueOrNull;
  bool get _loading => ref.watch(_loadProvider).isLoading;
  Object? get _error => ref.watch(_loadProvider).error;

  @override
  void didUpdateWidget(covariant _OverviewTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.reloadToken != widget.reloadToken) _refresh();
  }

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  void _refresh() {
    _load();
  }

  Future<void> _openForm(CashAction action) async {
    final boxes = _summary?.cashBoxes ?? const <CashBoxBalance>[];
    final saved = await showCashForm(context, action: action, boxes: boxes);
    if (saved == true) {
      widget.onChanged();
      if (mounted) {
        showModuleSnack(context, L10nGateway.current.transactionSaved);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final summary = _summary;
    if (_loading && summary == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (summary == null) {
      return ModuleMessage(
        text: errorText(_error ?? ''),
        icon: Icons.error_outline_rounded,
        color: context.appColors.error,
        onRetry: _refresh,
      );
    }
    final t = widget.token;
    final canAct = ModuleAccess.canViewCashBoxes(t);
    return RefreshIndicator(
      onRefresh: () async => _refresh(),
      color: context.appColors.primaryLight,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        children: [
          if (canAct)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (ModuleAccess.canAdjustCash(t))
                  _ActionChipButton(
                    icon: Icons.tune_rounded,
                    label: context.l10n.adjust,
                    onTap: () => _openForm(CashAction.adjustment),
                  ),
                if (ModuleAccess.canTransferCash(t))
                  _ActionChipButton(
                    icon: Icons.swap_horiz_rounded,
                    label: context.l10n.transfer,
                    onTap: () => _openForm(CashAction.transfer),
                  ),
                if (ModuleAccess.canCreateExchange(t))
                  _ActionChipButton(
                    icon: Icons.currency_exchange_rounded,
                    label: context.l10n.currencyExchange,
                    onTap: () => _openForm(CashAction.exchange),
                  ),
              ],
            ),
          if (canAct) const SizedBox(height: 14),
          _SectionTitle(text: context.l10n.totalsByCurrency),
          if (summary.totals.isEmpty)
            ModuleCard(
                child: Text(context.l10n.noBalancesYet, style: appTextStyle()))
          else
            ModuleCard(
              child: Column(
                children: [
                  for (final total in summary.totals)
                    _BalanceLine(
                      label: total.currency?.name ?? '',
                      code: total.currency?.label ?? '',
                      amount: total.balance,
                      color: total.balance < 0
                          ? context.appColors.error
                          : context.appColors.success,
                    ),
                ],
              ),
            ),
          if (summary.pendingRequests.isNotEmpty) ...[
            _SectionTitle(text: context.l10n.pendingRequests),
            ModuleCard(
              accent: context.appColors.warning,
              child: Column(
                children: [
                  for (final entry in summary.pendingRequests.entries)
                    _BalanceLine(
                      label: requestTypeLabel(entry.key),
                      code: '',
                      amount: entry.value.toDouble(),
                      color: context.appColors.warning,
                      isCount: true,
                    ),
                ],
              ),
            ),
          ],
          _SectionTitle(text: context.l10n.cashBoxes),
          if (summary.cashBoxes.isEmpty)
            ModuleMessage(text: context.l10n.noCashBoxesAvailable)
          else
            for (final box in summary.cashBoxes) _CashBoxCard(box: box),
        ],
      ),
    );
  }
}

class _ActionChipButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionChipButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label, style: appTextStyle(fontWeight: FontWeight.w700)),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 14, 4, 8),
      child: Text(
        text,
        style: appTextStyle(
          fontSize: FontSize.body,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _BalanceLine extends StatelessWidget {
  final String label;
  final String code;
  final double amount;
  final Color color;
  final bool isCount;

  const _BalanceLine({
    required this.label,
    required this.code,
    required this.amount,
    required this.color,
    this.isCount = false,
  });

  @override
  Widget build(BuildContext context) {
    final value = isCount ? amount.toInt().toString() : formatAmount(amount);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: appTextStyle(
                fontSize: FontSize.label,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          Text(
            code.isEmpty ? value : '$value $code',
            style: appTextStyle(
              fontSize: FontSize.bodyLarge,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _CashBoxCard extends StatelessWidget {
  final CashBoxBalance box;

  const _CashBoxCard({required this.box});

  @override
  Widget build(BuildContext context) {
    return ModuleCard(
      accent: box.isActive
          ? context.appColors.primaryLight
          : context.appColors.textMuted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  box.name,
                  style: appTextStyle(
                    fontSize: FontSize.bodyLarge,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              StatusPill(
                label:
                    box.isActive ? context.l10n.active : context.l10n.inactive,
                color: box.isActive
                    ? context.appColors.success
                    : context.appColors.textMuted,
              ),
            ],
          ),
          Text(box.code,
              style: appTextStyle(
                  fontSize: FontSize.caption, color: moduleMuted(context))),
          const SizedBox(height: 8),
          for (final row in box.currencies)
            _BalanceLine(
              label: row.currency?.name ?? '',
              code: row.currency?.label ?? '',
              amount: row.balance,
              color: row.balance < 0
                  ? context.appColors.error
                  : context.appColors.brandPrimary,
            ),
          const Divider(height: 16),
          Row(
            children: [
              Text(context.l10n.localEquivalent,
                  style: appTextStyle(
                      fontSize: FontSize.caption, color: moduleMuted(context))),
              const Spacer(),
              Text(
                formatAmount(box.localTotal),
                style: appTextStyle(
                    fontSize: FontSize.label, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── السجل ─────────────────────────────────────────────────────────────────────

class _LedgerTab extends ConsumerStatefulWidget {
  final FinanceActionsController service;
  final int reloadToken;

  const _LedgerTab({required this.service, required this.reloadToken});

  @override
  ConsumerState<_LedgerTab> createState() => _LedgerTabState();
}

class _LedgerTabState extends ConsumerState<_LedgerTab> {
  String? _direction;
  int _filterToken = 0;

  @override
  Widget build(BuildContext context) {
    return PagedList<LedgerEntry>(
      reloadToken: widget.reloadToken + _filterToken,
      emptyText: context.l10n.noLedgerEntries,
      header: _FilterBar(
        options: {
          null: L10nGateway.current.all,
          'in': L10nGateway.current.incoming,
          'out': L10nGateway.current.outgoing,
        },
        selected: _direction,
        onSelected: (value) => setState(() {
          _direction = value;
          _filterToken++;
        }),
      ),
      fetch: (page) => ref
          .read(financeActionsControllerProvider.notifier)
          .query((r) => r.transactions(
                page: page,
                direction: _direction,
              )),
      itemBuilder: (context, entry, _) => _LedgerCard(entry: entry),
    );
  }
}

class _FilterBar extends StatelessWidget {
  final Map<String?, String> options;
  final String? selected;
  final ValueChanged<String?> onSelected;

  const _FilterBar({
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        children: [
          for (final entry in options.entries)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: ChoiceChip(
                label: Text(entry.value,
                    style: appTextStyle(fontSize: FontSize.caption)),
                selected: entry.key == selected,
                onSelected: (_) => onSelected(entry.key),
              ),
            ),
        ],
      ),
    );
  }
}

class _LedgerCard extends StatelessWidget {
  final LedgerEntry entry;

  const _LedgerCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final color =
        entry.isIncoming ? context.appColors.success : context.appColors.error;
    final sign = entry.isIncoming ? '+' : '-';
    return ModuleCard(
      accent: color,
      onTap: () => showRecordSheet(
        context,
        title: entry.transactionNo,
        subtitle: ledgerTypeLabel(entry.type),
        rows: [
          MapEntry(L10nGateway.current.cashBox, entry.cashBox?.name ?? ''),
          MapEntry(L10nGateway.current.date, entry.transactionDate),
          MapEntry(L10nGateway.current.amount,
              '${formatAmount(entry.amount)} ${entry.currency?.label ?? ''}'),
          MapEntry(L10nGateway.current.localEquivalent,
              formatAmount(entry.localAmount)),
          MapEntry(L10nGateway.current.category, entry.categoryName ?? ''),
          MapEntry(L10nGateway.current.description, entry.description ?? ''),
          MapEntry(L10nGateway.current.enteredBy, entry.enteredByName ?? ''),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ledgerTypeLabel(entry.type),
                  style: appTextStyle(
                      fontSize: FontSize.body,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
              StatusPill(
                label: entry.isIncoming
                    ? context.l10n.incoming
                    : context.l10n.outgoing,
                color: color,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                  entry.cashBox?.name ?? '—',
                  style: appTextStyle(
                      fontSize: FontSize.caption, color: moduleMuted(context)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$sign${formatAmount(entry.amount)} ${entry.currency?.label ?? ''}',
                style: appTextStyle(
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w800,
                    color: color),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(entry.transactionDate,
              style: appTextStyle(
                  fontSize: FontSize.caption, color: moduleMuted(context))),
        ],
      ),
    );
  }
}

// ─── التحويلات والصرف والطلبات ───────────────────────────────────────────────

class _TransfersTab extends StatelessWidget {
  final FinanceActionsController service;
  final int reloadToken;

  const _TransfersTab({required this.service, required this.reloadToken});

  @override
  Widget build(BuildContext context) {
    return PagedList<CashBoxTransfer>(
      reloadToken: reloadToken,
      emptyText: context.l10n.noTransfers,
      fetch: (page) => service.query((r) => r.transfers(page: page)),
      itemBuilder: (context, transfer, _) {
        return ModuleCard(
          onTap: () => showRecordSheet(
            context,
            title: transfer.transferNo,
            subtitle: transfer.transferDate,
            rows: [
              MapEntry(
                  L10nGateway.current.from, transfer.fromCashBox?.name ?? ''),
              MapEntry(L10nGateway.current.to, transfer.toCashBox?.name ?? ''),
              MapEntry(L10nGateway.current.amount,
                  '${formatAmount(transfer.amount)} ${transfer.currency?.label ?? ''}'),
              MapEntry(L10nGateway.current.notes, transfer.notes ?? ''),
              MapEntry(
                  L10nGateway.current.enteredBy, transfer.enteredByName ?? ''),
            ],
          ),
          child: _TwoLineRow(
            title: transfer.transferNo,
            subtitle:
                '${transfer.fromCashBox?.name ?? '—'}  ←  ${transfer.toCashBox?.name ?? '—'}',
            trailing:
                '${formatAmount(transfer.amount)} ${transfer.currency?.label ?? ''}',
            date: transfer.transferDate,
          ),
        );
      },
    );
  }
}

class _ExchangesTab extends StatelessWidget {
  final FinanceActionsController service;
  final int reloadToken;

  const _ExchangesTab({required this.service, required this.reloadToken});

  @override
  Widget build(BuildContext context) {
    return PagedList<CurrencyExchange>(
      reloadToken: reloadToken,
      emptyText: context.l10n.noExchanges,
      fetch: (page) => service.query((r) => r.exchanges(page: page)),
      itemBuilder: (context, exchange, _) {
        final from =
            '${formatAmount(exchange.fromAmount)} ${exchange.fromCurrency?.label ?? ''}';
        final to =
            '${formatAmount(exchange.toAmount)} ${exchange.toCurrency?.label ?? ''}';
        return ModuleCard(
          onTap: () => showRecordSheet(
            context,
            title: exchange.exchangeNo,
            subtitle: exchange.exchangeDate,
            rows: [
              MapEntry(L10nGateway.current.from,
                  '$from · ${exchange.fromCashBox?.name ?? ''}'),
              MapEntry(L10nGateway.current.to,
                  '$to · ${exchange.toCashBox?.name ?? ''}'),
              MapEntry(L10nGateway.current.localEquivalent,
                  formatAmount(exchange.localAmount)),
              MapEntry(L10nGateway.current.notes, exchange.notes ?? ''),
              MapEntry(
                  L10nGateway.current.enteredBy, exchange.enteredByName ?? ''),
            ],
          ),
          child: _TwoLineRow(
            title: exchange.exchangeNo,
            subtitle: '$from  ←  $to',
            trailing: exchange.fromCashBox?.name ?? '',
            date: exchange.exchangeDate,
          ),
        );
      },
    );
  }
}

class _RequestsTab extends ConsumerStatefulWidget {
  final FinanceActionsController service;
  final int reloadToken;

  const _RequestsTab({required this.service, required this.reloadToken});

  @override
  ConsumerState<_RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends ConsumerState<_RequestsTab> {
  String? _status;
  int _filterToken = 0;

  @override
  Widget build(BuildContext context) {
    return PagedList<FinanceRequestItem>(
      reloadToken: widget.reloadToken + _filterToken,
      emptyText: context.l10n.noRequests,
      header: _FilterBar(
        options: {
          null: L10nGateway.current.all,
          'pending': L10nGateway.current.pending2,
          'accepted': L10nGateway.current.accepted,
          'declined': L10nGateway.current.declined,
          'settled': L10nGateway.current.settled,
        },
        selected: _status,
        onSelected: (value) => setState(() {
          _status = value;
          _filterToken++;
        }),
      ),
      fetch: (page) => ref
          .read(financeActionsControllerProvider.notifier)
          .query((r) => r.requests(page: page, status: _status)),
      itemBuilder: (context, request, _) {
        final color = _requestStatusColor(context, request.status);
        final amount =
            '${formatAmount(request.requestedAmount)} ${request.requestedCurrency?.label ?? ''}';
        return ModuleCard(
          accent: color,
          onTap: () => showRecordSheet(
            context,
            title: request.requestNo,
            subtitle: requestTypeLabel(request.type),
            rows: [
              MapEntry(L10nGateway.current.status,
                  requestStatusLabel(request.status)),
              MapEntry(L10nGateway.current.requestedAmount, amount),
              MapEntry(
                  L10nGateway.current.acceptedAmount,
                  request.acceptedAmount == null
                      ? ''
                      : formatAmount(request.acceptedAmount!)),
              MapEntry(L10nGateway.current.cashBox, request.cashBoxName ?? ''),
              MapEntry(
                  L10nGateway.current.category, request.categoryName ?? ''),
              MapEntry(L10nGateway.current.counterparty,
                  request.counterpartyName ?? ''),
              MapEntry(
                  L10nGateway.current.reason, request.requestedReason ?? ''),
              MapEntry(
                  L10nGateway.current.reviewNotes, request.reviewNotes ?? ''),
              MapEntry(L10nGateway.current.requestedBy,
                  request.requestedByName ?? ''),
              MapEntry(
                  L10nGateway.current.reviewedBy, request.reviewedByName ?? ''),
            ],
          ),
          child: _TwoLineRow(
            title: request.requestNo,
            subtitle: requestTypeLabel(request.type),
            trailing: amount,
            date: requestStatusLabel(request.status),
            trailingColor: color,
          ),
        );
      },
    );
  }
}

class _TwoLineRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final String date;
  final Color? trailingColor;

  const _TwoLineRow({
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.date,
    this.trailingColor,
  });

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: appTextStyle(
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w800,
                    color: onSurface),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              trailing,
              style: appTextStyle(
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w800,
                  color: trailingColor ?? onSurface),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: appTextStyle(
              fontSize: FontSize.caption, color: moduleMuted(context)),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(date,
            style: appTextStyle(
                fontSize: FontSize.caption, color: moduleMuted(context))),
      ],
    );
  }
}
