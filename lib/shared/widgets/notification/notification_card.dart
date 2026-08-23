import 'package:flutter/material.dart';
import 'package:hobitix/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final AppNotification notification;
  final VoidCallback onTap;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 76),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.025),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Unread indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: notification.isUnread ? 3 : 0,
              height: notification.isUnread ? 52 : 0,
              decoration: const BoxDecoration(
                color: Color(0xFF6352E8),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(4),
                ),
              ),
            ),

            const SizedBox(width: 8),

            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFF0EEFF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                notification.icon,
                size: 16,
                color: const Color(0xFF5C4CE0),
              ),
            ),

            const SizedBox(width: 12),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.3,
                        fontWeight: notification.isUnread
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: const Color(0xFF292733),
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      notification.message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.3,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF676370),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      notification.time,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9B98A3),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
