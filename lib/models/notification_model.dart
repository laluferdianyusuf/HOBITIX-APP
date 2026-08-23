import 'package:flutter/material.dart';

class AppNotification {
  final String title;
  final String message;
  final String time;
  final NotificationType type;
  final IconData icon;
  bool isUnread;

  AppNotification({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    required this.icon,
    required this.isUnread,
  });
}

enum NotificationType { events, updates }
