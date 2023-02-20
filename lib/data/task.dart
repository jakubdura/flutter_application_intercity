import 'dart:ui';

class Task {
  const Task({
    required this.title,
    this.subtitle,
    this.color,
  });

  final Color? color;
  final String title;
  final String? subtitle;
}
