import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/finance/data/models/finance_model.dart';
import 'package:alkheir_mosque/features/finance/data/repositories/finance_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'finance_forms.dart';

enum _FinanceTab { overview, ledger, transfers, exchanges, requests }

/// شاشة المالية: نظرة عامة على الصناديق، والسجل، والتحويلات، والصرف، والطلبات.
/// كل تبويب يظهر فقط إذا كانت صلاحيته موجودة في تسجيل الدخول.
class FinanceScreen extends StatefulWidget {
  final AuthToken token;

  const FinanceScreen({super.key, required this.token});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen>
    with TickerProviderStateMixin {
  final _service = FinanceRepositoryImpl();
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
        _FinanceTab.overview => tr('نظرة عامة'),
        _FinanceTab.ledger => tr('السجل'),
        _FinanceTab.transfers => tr('التحويلات'),
        _FinanceTab.exchanges => tr('الصرف'),
        _FinanceTab.requests => tr('الطلبات'),
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
        title: tr('المالية'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('المالية'),
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
      'pull' => tr('طلب سحب'),
      'expense' => tr('طلب مصروف'),
      'revenue' => tr('طلب إيراد'),
      'return' => tr('طلب إرجاع'),
      _ => type,
    };

String requestStatusLabel(String status) => switch (status) {
      'pending' => tr('معلّق'),
      'accepted' => tr('مقبول'),
      'declined' => tr('مرفوض'),
      'settled' => tr('مُسوّى'),
      _ => status,
    };

Color _requestStatusColor(String status) => switch (status) {
      'pending' => AppColors.warning,
      'accepted' || 'settled' => AppColors.success,
      'declined' => AppColors.error,
      _ => AppColors.info,
    };

String ledgerTypeLabel(String type) => switch (type) {
      'manual_adjustment' => tr('تسوية يدوية'),
      'cash_box_transfer' => tr('تحويل بين الصناديق'),
      'currency_exchange' => tr('صرف عملة'),
      _ => type.replaceAll('_', ' '),
    };

// ─── نظرة عامة ─────────────────────────────────────────────────────────────────

class _OverviewTab extends StatefulWidget {
  final AuthToken token;
  final FinanceRepositoryImpl service;
  final int reloadToken;
  final VoidCallback onChanged;

  const _OverviewTab({
    required this.token,
    required this.service,
    required this.reloadToken,
    required this.onChanged,
  });

  @override
  State<_OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<_OverviewTab> {
  FinanceSummary? _summary;
  bool _loading = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant _OverviewTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.reloadToken != widget.reloadToken) _refresh();
  }

  Future<void> _load() async {
    try {
      final summary = await widget.service.summary();
      if (!mounted) return;
      setState(() {
        _summary = summary;
        _loading = false;
        _error = null;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  void _refresh() {
    setState(() {
      _loading = true;
      _error = null;
    });
    _load();
  }

  Future<void> _openForm(CashAction action) async {
    final boxes = _summary?.cashBoxes ?? const <CashBoxBalance>[];
    final saved = await showCashForm(context, action: action, boxes: boxes);
    if (saved == true) {
      widget.onChanged();
      if (mounted) showModuleSnack(context, tr('تم حفظ العملية'));
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
        color: AppColors.error,
        onRetry: _refresh,
      );
    }
    final t = widget.token;
    final canAct = ModuleAccess.canViewCashBoxes(t);
    return RefreshIndicator(
      onRefresh: () async => _refresh(),
      color: AppColors.primaryLight,
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
                    label: tr('تسوية'),
                    onTap: () => _openForm(CashAction.adjustment),
                  ),
                if (ModuleAccess.canTransferCash(t))
                  _ActionChipButton(
                    icon: Icons.swap_horiz_rounded,
                    label: tr('تحويل'),
                    onTap: () => _openForm(CashAction.transfer),
                  ),
                if (ModuleAccess.canCreateExchange(t))
                  _ActionChipButton(
                    icon: Icons.currency_exchange_rounded,
                    label: tr('صرف عملة'),
                    onTap: () => _openForm(CashAction.exchange),
                  ),
              ],
            ),
          if (canAct) const SizedBox(height: 14),
          _SectionTitle(text: tr('الإجماليات حسب العملة')),
          if (summary.totals.isEmpty)
            ModuleCard(
                child: Text(tr('لا توجد أرصدة بعد'), style: appTextStyle()))
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
                          ? AppColors.error
                          : AppColors.success,
                    ),
                ],
              ),
            ),
          if (summary.pendingRequests.isNotEmpty) ...[
            _SectionTitle(text: tr('طلبات معلّقة')),
            ModuleCard(
              accent: AppColors.warning,
              child: Column(
                children: [
                  for (final entry in summary.pendingRequests.entries)
                    _BalanceLine(
                      label: requestTypeLabel(entry.key),
                      code: '',
                      amount: entry.value.toDouble(),
                      color: AppColors.warning,
                      isCount: true,
                    ),
                ],
              ),
            ),
          ],
          _SectionTitle(text: tr('الصناديق')),
          if (summary.cashBoxes.isEmpty)
            ModuleMessage(text: tr('لا توجد صناديق متاحة'))
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
          fontSize: 14,
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
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          Text(
            code.isEmpty ? value : '$value $code',
            style: appTextStyle(
              fontSize: 15,
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
      accent: box.isActive ? AppColors.primaryLight : AppColors.textMuted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  box.name,
                  style: appTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              StatusPill(
                label: box.isActive ? tr('نشط') : tr('غير نشط'),
                color: box.isActive ? AppColors.success : AppColors.textMuted,
              ),
            ],
          ),
          Text(box.code,
              style: appTextStyle(fontSize: 11, color: moduleMuted(context))),
          const SizedBox(height: 8),
          for (final row in box.currencies)
            _BalanceLine(
              label: row.currency?.name ?? '',
              code: row.currency?.label ?? '',
              amount: row.balance,
              color: row.balance < 0 ? AppColors.error : AppColors.primary,
            ),
          const Divider(height: 16),
          Row(
            children: [
              Text(tr('المعادل المحلي'),
                  style:
                      appTextStyle(fontSize: 12, color: moduleMuted(context))),
              const Spacer(),
              Text(
                formatAmount(box.localTotal),
                style: appTextStyle(fontSize: 13, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── السجل ─────────────────────────────────────────────────────────────────────

class _LedgerTab extends StatefulWidget {
  final FinanceRepositoryImpl service;
  final int reloadToken;

  const _LedgerTab({required this.service, required this.reloadToken});

  @override
  State<_LedgerTab> createState() => _LedgerTabState();
}

class _LedgerTabState extends State<_LedgerTab> {
  String? _direction;
  int _filterToken = 0;

  @override
  Widget build(BuildContext context) {
    return PagedList<LedgerEntry>(
      reloadToken: widget.reloadToken + _filterToken,
      emptyText: tr('لا توجد حركات مالية'),
      header: _FilterBar(
        options: {
          null: tr('الكل'),
          'in': tr('وارد'),
          'out': tr('صادر'),
        },
        selected: _direction,
        onSelected: (value) => setState(() {
          _direction = value;
          _filterToken++;
        }),
      ),
      fetch: (page) => widget.service.transactions(
        page: page,
        direction: _direction,
      ),
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
              padding: const EdgeInsets.only(left: 8),
              child: ChoiceChip(
                label: Text(entry.value, style: appTextStyle(fontSize: 12)),
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
    final color = entry.isIncoming ? AppColors.success : AppColors.error;
    final sign = entry.isIncoming ? '+' : '-';
    return ModuleCard(
      accent: color,
      onTap: () => showRecordSheet(
        context,
        title: entry.transactionNo,
        subtitle: ledgerTypeLabel(entry.type),
        rows: [
          MapEntry(tr('الصندوق'), entry.cashBox?.name ?? ''),
          MapEntry(tr('التاريخ'), entry.transactionDate),
          MapEntry(tr('المبلغ'),
              '${formatAmount(entry.amount)} ${entry.currency?.label ?? ''}'),
          MapEntry(tr('المعادل المحلي'), formatAmount(entry.localAmount)),
          MapEntry(tr('التصنيف'), entry.categoryName ?? ''),
          MapEntry(tr('الوصف'), entry.description ?? ''),
          MapEntry(tr('أدخلها'), entry.enteredByName ?? ''),
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
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
              StatusPill(
                label: entry.isIncoming ? tr('وارد') : tr('صادر'),
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
                  style:
                      appTextStyle(fontSize: 12, color: moduleMuted(context)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$sign${formatAmount(entry.amount)} ${entry.currency?.label ?? ''}',
                style: appTextStyle(
                    fontSize: 14, fontWeight: FontWeight.w800, color: color),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(entry.transactionDate,
              style: appTextStyle(fontSize: 11, color: moduleMuted(context))),
        ],
      ),
    );
  }
}

// ─── التحويلات والصرف والطلبات ───────────────────────────────────────────────

class _TransfersTab extends StatelessWidget {
  final FinanceRepositoryImpl service;
  final int reloadToken;

  const _TransfersTab({required this.service, required this.reloadToken});

  @override
  Widget build(BuildContext context) {
    return PagedList<CashBoxTransfer>(
      reloadToken: reloadToken,
      emptyText: tr('لا توجد تحويلات'),
      fetch: (page) => service.transfers(page: page),
      itemBuilder: (context, transfer, _) {
        return ModuleCard(
          onTap: () => showRecordSheet(
            context,
            title: transfer.transferNo,
            subtitle: transfer.transferDate,
            rows: [
              MapEntry(tr('من'), transfer.fromCashBox?.name ?? ''),
              MapEntry(tr('إلى'), transfer.toCashBox?.name ?? ''),
              MapEntry(tr('المبلغ'),
                  '${formatAmount(transfer.amount)} ${transfer.currency?.label ?? ''}'),
              MapEntry(tr('ملاحظات'), transfer.notes ?? ''),
              MapEntry(tr('أدخلها'), transfer.enteredByName ?? ''),
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
  final FinanceRepositoryImpl service;
  final int reloadToken;

  const _ExchangesTab({required this.service, required this.reloadToken});

  @override
  Widget build(BuildContext context) {
    return PagedList<CurrencyExchange>(
      reloadToken: reloadToken,
      emptyText: tr('لا توجد عمليات صرف'),
      fetch: (page) => service.exchanges(page: page),
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
              MapEntry(tr('من'), '$from · ${exchange.fromCashBox?.name ?? ''}'),
              MapEntry(tr('إلى'), '$to · ${exchange.toCashBox?.name ?? ''}'),
              MapEntry(
                  tr('المعادل المحلي'), formatAmount(exchange.localAmount)),
              MapEntry(tr('ملاحظات'), exchange.notes ?? ''),
              MapEntry(tr('أدخلها'), exchange.enteredByName ?? ''),
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

class _RequestsTab extends StatefulWidget {
  final FinanceRepositoryImpl service;
  final int reloadToken;

  const _RequestsTab({required this.service, required this.reloadToken});

  @override
  State<_RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<_RequestsTab> {
  String? _status;
  int _filterToken = 0;

  @override
  Widget build(BuildContext context) {
    return PagedList<FinanceRequestItem>(
      reloadToken: widget.reloadToken + _filterToken,
      emptyText: tr('لا توجد طلبات'),
      header: _FilterBar(
        options: {
          null: tr('الكل'),
          'pending': tr('معلّق'),
          'accepted': tr('مقبول'),
          'declined': tr('مرفوض'),
          'settled': tr('مُسوّى'),
        },
        selected: _status,
        onSelected: (value) => setState(() {
          _status = value;
          _filterToken++;
        }),
      ),
      fetch: (page) => widget.service.requests(page: page, status: _status),
      itemBuilder: (context, request, _) {
        final color = _requestStatusColor(request.status);
        final amount =
            '${formatAmount(request.requestedAmount)} ${request.requestedCurrency?.label ?? ''}';
        return ModuleCard(
          accent: color,
          onTap: () => showRecordSheet(
            context,
            title: request.requestNo,
            subtitle: requestTypeLabel(request.type),
            rows: [
              MapEntry(tr('الحالة'), requestStatusLabel(request.status)),
              MapEntry(tr('المبلغ المطلوب'), amount),
              MapEntry(
                  tr('المبلغ المعتمد'),
                  request.acceptedAmount == null
                      ? ''
                      : formatAmount(request.acceptedAmount!)),
              MapEntry(tr('الصندوق'), request.cashBoxName ?? ''),
              MapEntry(tr('التصنيف'), request.categoryName ?? ''),
              MapEntry(tr('الجهة'), request.counterpartyName ?? ''),
              MapEntry(tr('السبب'), request.requestedReason ?? ''),
              MapEntry(tr('ملاحظات المراجعة'), request.reviewNotes ?? ''),
              MapEntry(tr('مقدّم الطلب'), request.requestedByName ?? ''),
              MapEntry(tr('المراجِع'), request.reviewedByName ?? ''),
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
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: onSurface),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              trailing,
              style: appTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: trailingColor ?? onSurface),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(date,
            style: appTextStyle(fontSize: 11, color: moduleMuted(context))),
      ],
    );
  }
}
