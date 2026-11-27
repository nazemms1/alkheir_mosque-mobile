part of '../pages/attendance_screen.dart';

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String text;
  const _EmptyState({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) =>
      AdminEmptyState(icon: icon, title: text);
}
