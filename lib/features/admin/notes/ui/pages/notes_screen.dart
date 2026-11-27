import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';

class NotesScreen extends StatefulWidget {
  final List<NoteMessage> notes;
  final String studentName;
  const NotesScreen(
      {super.key, required this.notes, required this.studentName});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  final _msgCtrl = TextEditingController();
  final _scrollCtrl = ScrollController();
  bool _sending = false;
  late List<NoteMessage> _messages;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _ctrl.forward();
    _messages = List.from(widget.notes);
    // Sort oldest first for chat view
    _messages.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _msgCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final text = _msgCtrl.text.trim();
    if (text.isEmpty) return;
    setState(() => _sending = true);
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    final newMsg = NoteMessage(
      id: 'NEW-${DateTime.now().millisecondsSinceEpoch}',
      dateTime: DateTime.now(),
      author: NoteAuthor.parent,
      authorName: L10nGateway.current.parent,
      content: text,
      isRead: true,
    );
    setState(() {
      _messages.add(newMsg);
      _msgCtrl.clear();
      _sending = false;
    });
    await Future.delayed(const Duration(milliseconds: 100));
    if (_scrollCtrl.hasClients) {
      _scrollCtrl.animateTo(
        _scrollCtrl.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final unread = _messages
        .where((m) => !m.isRead && m.author != NoteAuthor.parent)
        .length;
    return FadeTransition(
      opacity: _fade,
      child: Column(
        children: [
          _NotesHeader(studentName: widget.studentName, unread: unread),
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Text(
                      context.l10n.noMessagesYet,
                      style: TextStyle(
                          fontFamily: 'Dubai',
                          color: context.appColors.textMuted),
                    ),
                  )
                : ListView.builder(
                    controller: _scrollCtrl,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                    itemCount: _messages.length,
                    itemBuilder: (_, i) {
                      final msg = _messages[i];
                      final prevMsg = i > 0 ? _messages[i - 1] : null;
                      final showDate = prevMsg == null ||
                          !_isSameDay(msg.dateTime, prevMsg.dateTime);
                      return Column(
                        children: [
                          if (showDate) _DateDivider(date: msg.dateTime),
                          _MessageBubble(message: msg),
                        ],
                      );
                    },
                  ),
          ),
          _InputBar(
            controller: _msgCtrl,
            sending: _sending,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}

// ─── Header ───────────────────────────────────────────────────────────────────
class _NotesHeader extends StatelessWidget {
  final String studentName;
  final int unread;
  const _NotesHeader({required this.studentName, required this.unread});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.appColors.surfaceBlackGreen,
            Color(0xFF0A2C10),
            context.appColors.brandMid
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: context.appColors.brandDeep.withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.appColors.successGreen,
                      context.appColors.brandGreen
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color:
                          context.appColors.primaryLight.withValues(alpha: 0.4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const Icon(Icons.groups_2_rounded,
                    color: Colors.white, size: 24),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    color: context.appColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: context.appColors.surfaceBlackGreen, width: 2),
                    boxShadow: [
                      BoxShadow(
                          color:
                              context.appColors.success.withValues(alpha: 0.5),
                          blurRadius: 6),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.teacherAdministration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.bodyLarge,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Dubai',
                  ),
                ),
                Text(
                  context.l10n.regarding(studentName),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: FontSize.caption,
                    fontFamily: 'Dubai',
                  ),
                ),
              ],
            ),
          ),
          if (unread > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                gradient: context.appColors.gradientGold,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: context.appColors.gold.withValues(alpha: 0.4),
                      blurRadius: 10),
                ],
              ),
              child: Text(
                context.l10n.tNew(unread),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Dubai',
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Date Divider ─────────────────────────────────────────────────────────────
class _DateDivider extends StatelessWidget {
  final DateTime date;
  const _DateDivider({required this.date});

  @override
  Widget build(BuildContext context) {
    final label =
        DateFormat('EEEE، d MMMM yyyy', AppLanguage.intlCode).format(date);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(child: Divider(color: Theme.of(context).dividerColor)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: TextStyle(
                color: context.appColors.textMuted,
                fontSize: FontSize.caption,
                fontFamily: 'Dubai',
              ),
            ),
          ),
          Expanded(child: Divider(color: Theme.of(context).dividerColor)),
        ],
      ),
    );
  }
}

// ─── Message Bubble ───────────────────────────────────────────────────────────
class _MessageBubble extends StatelessWidget {
  final NoteMessage message;
  const _MessageBubble({required this.message});

  bool get _isParent => message.author == NoteAuthor.parent;

  Color _authorColor(BuildContext context) {
    switch (message.author) {
      case NoteAuthor.parent:
        return context.appColors.primaryLight;
      case NoteAuthor.teacher:
        return context.appColors.info;
      case NoteAuthor.admin:
        return context.appColors.gold;
    }
  }

  IconData get _authorIcon {
    switch (message.author) {
      case NoteAuthor.parent:
        return Icons.person_rounded;
      case NoteAuthor.teacher:
        return Icons.school_rounded;
      case NoteAuthor.admin:
        return Icons.admin_panel_settings_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeStr =
        DateFormat('HH:mm', AppLanguage.intlCode).format(message.dateTime);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment:
            _isParent ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!_isParent) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _authorColor(context).withValues(alpha: 0.15),
                shape: BoxShape.circle,
                border: Border.all(
                    color: _authorColor(context).withValues(alpha: 0.3)),
              ),
              child: Icon(_authorIcon, size: 16, color: _authorColor(context)),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  _isParent ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                if (!_isParent)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(bottom: 3, start: 4),
                    child: Text(
                      message.authorName,
                      style: TextStyle(
                        color: _authorColor(context),
                        fontSize: FontSize.caption,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Dubai',
                      ),
                    ),
                  ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  decoration: BoxDecoration(
                    gradient: _isParent
                        ? const LinearGradient(
                            colors: [Color(0xFFE8F5EB), Color(0xFFD4EED8)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                    color: _isParent
                        ? null
                        : Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                      bottomLeft: Radius.circular(_isParent ? 4 : 18),
                      bottomRight: Radius.circular(_isParent ? 18 : 4),
                    ),
                    border: Border.all(
                      color: _isParent
                          ? context.appColors.primaryLight
                              .withValues(alpha: 0.3)
                          : _authorColor(context).withValues(alpha: 0.2),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: (_isParent
                                ? context.appColors.primaryLight
                                : _authorColor(context))
                            .withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    message.content,
                    style: TextStyle(
                      color: _isParent
                          ? context.appColors.brandPrimary
                          : context.appColors.textPrimary,
                      fontSize: FontSize.label,
                      fontFamily: 'Dubai',
                      height: 1.55,
                      fontWeight: _isParent ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      timeStr,
                      style: TextStyle(
                        color: context.appColors.textMuted,
                        fontSize: FontSize.caption,
                        fontFamily: 'Dubai',
                      ),
                    ),
                    if (!_isParent && !message.isRead) ...[
                      const SizedBox(width: 4),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: context.appColors.gold,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (_isParent) ...[
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: context.appColors.gradientPrimary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person_rounded,
                  size: 16, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Input Bar ────────────────────────────────────────────────────────────────
class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final bool sending;
  final VoidCallback onSend;
  const _InputBar(
      {required this.controller, required this.sending, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: 3,
                minLines: 1,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => onSend(),
                style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.body,
                    color: context.appColors.textPrimary),
                decoration: InputDecoration(
                  hintText: context.l10n.writeYourMessageToThe,
                  hintStyle: TextStyle(
                      fontFamily: 'Dubai',
                      fontSize: FontSize.label,
                      color: context.appColors.textMuted),
                  filled: true,
                  fillColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Theme.of(context).dividerColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Theme.of(context).dividerColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: context.appColors.primaryLight, width: 1.5),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: sending ? null : onSend,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  gradient: sending ? null : context.appColors.gradientPrimary,
                  color: sending
                      ? context.appColors.textMuted.withValues(alpha: 0.2)
                      : null,
                  shape: BoxShape.circle,
                  boxShadow: sending
                      ? null
                      : [
                          BoxShadow(
                              color: context.appColors.brandPrimary
                                  .withValues(alpha: 0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4))
                        ],
                ),
                child: sending
                    ? Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: context.appColors.brandPrimary)))
                    : const Icon(Icons.send_rounded,
                        color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
