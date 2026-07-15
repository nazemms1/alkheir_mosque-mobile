import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';

class NotesScreen extends StatefulWidget {
  final List<NoteMessage> notes;
  final String studentName;
  const NotesScreen({super.key, required this.notes, required this.studentName});

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
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
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
      authorName: 'ولي الأمر',
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
    final unread = _messages.where((m) => !m.isRead && m.author != NoteAuthor.parent).length;
    return FadeTransition(
      opacity: _fade,
      child: Column(
        children: [
          _NotesHeader(studentName: widget.studentName, unread: unread),
          Expanded(
            child: _messages.isEmpty
                ? const Center(
                    child: Text(
                      'لا توجد رسائل بعد',
                      style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted),
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
        gradient: const LinearGradient(
          colors: [Color(0xFF060E08), Color(0xFF0A2C10), Color(0xFF0D4515)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0D5016).withOpacity(0.4),
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
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2EA043), Color(0xFF1A7A26)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryLight.withOpacity(0.4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const Icon(Icons.groups_2_rounded, color: Colors.white, size: 24),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF060E08), width: 2),
                    boxShadow: [
                      BoxShadow(color: AppColors.success.withOpacity(0.5), blurRadius: 6),
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
                const Text(
                  'المعلم والإدارة',
                  style: TextStyle(
                    color: Colors.white, fontSize: 15,
                    fontWeight: FontWeight.w700, fontFamily: 'Cairo',
                  ),
                ),
                Text(
                  'بخصوص: $studentName',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 11, fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
          if (unread > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                gradient: AppColors.gradientGold,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: AppColors.gold.withOpacity(0.4), blurRadius: 10),
                ],
              ),
              child: Text(
                '$unread جديد',
                style: const TextStyle(
                  color: Colors.white, fontSize: 11,
                  fontWeight: FontWeight.w700, fontFamily: 'Cairo',
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
    final label = DateFormat('EEEE، d MMMM yyyy', 'ar').format(date);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(child: Divider(color: Theme.of(context).dividerColor)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 11,
                fontFamily: 'Cairo',
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

  Color get _authorColor {
    switch (message.author) {
      case NoteAuthor.parent: return AppColors.primaryLight;
      case NoteAuthor.teacher: return AppColors.info;
      case NoteAuthor.admin: return AppColors.gold;
    }
  }

  IconData get _authorIcon {
    switch (message.author) {
      case NoteAuthor.parent: return Icons.person_rounded;
      case NoteAuthor.teacher: return Icons.school_rounded;
      case NoteAuthor.admin: return Icons.admin_panel_settings_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('HH:mm', 'ar').format(message.dateTime);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: _isParent ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!_isParent) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _authorColor.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(color: _authorColor.withOpacity(0.3)),
              ),
              child: Icon(_authorIcon, size: 16, color: _authorColor),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: _isParent ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                if (!_isParent)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3, right: 4),
                    child: Text(
                      message.authorName,
                      style: TextStyle(
                        color: _authorColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  decoration: BoxDecoration(
                    gradient: _isParent
                        ? const LinearGradient(
                            colors: [Color(0xFFE8F5EB), Color(0xFFD4EED8)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                    color: _isParent ? null : Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                      bottomLeft: Radius.circular(_isParent ? 4 : 18),
                      bottomRight: Radius.circular(_isParent ? 18 : 4),
                    ),
                    border: Border.all(
                      color: _isParent
                          ? AppColors.primaryLight.withOpacity(0.3)
                          : _authorColor.withOpacity(0.2),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: (_isParent ? AppColors.primaryLight : _authorColor).withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    message.content,
                    style: TextStyle(
                      color: _isParent ? AppColors.primary : AppColors.textPrimary,
                      fontSize: 13,
                      fontFamily: 'Cairo',
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
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 10,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    if (!_isParent && !message.isRead) ...[
                      const SizedBox(width: 4),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.gold,
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
                gradient: AppColors.gradientPrimary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person_rounded, size: 16, color: Colors.white),
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
  const _InputBar({required this.controller, required this.sending, required this.onSend});

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
                style: const TextStyle(fontFamily: 'Cairo', fontSize: 14, color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: 'اكتب رسالتك للمعلم أو الإدارة...',
                  hintStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.textMuted),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.5),
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
                  gradient: sending ? null : AppColors.gradientPrimary,
                  color: sending ? AppColors.textMuted.withOpacity(0.2) : null,
                  shape: BoxShape.circle,
                  boxShadow: sending
                      ? null
                      : [BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 12, offset: const Offset(0, 4))],
                ),
                child: sending
                    ? const Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary)))
                    : const Icon(Icons.send_rounded, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
