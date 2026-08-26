import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/shared/widgets/icon_button.dart';
import 'package:iconsax/iconsax.dart';

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF8F8FA),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,

      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Center(
          child: AppIconButton(
            icon: Iconsax.arrow_left,
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/home');
              }
            },
          ),
        ),
      ),

      title: const Text(
        "Notifications",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Color(0xFF4B36D8),
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: PopupMenuButton<String>(
            tooltip: 'Notification settings',

            offset: const Offset(0, 44),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),

            color: Colors.white,

            onSelected: (value) {
              switch (value) {
                case 'read':
                  debugPrint('Mark all as read');

                  // TODO:
                  // panggil API / update state
                  break;

                case 'unread':
                  debugPrint('Mark all as unread');

                  // TODO:
                  // panggil API / update state
                  break;
              }
            },

            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'read',
                child: Row(
                  children: [
                    Icon(
                      Iconsax.message_tick,
                      size: 19,
                      color: Color(0xFF444444),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Mark all as read',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),

              const PopupMenuItem<String>(
                value: 'unread',
                child: Row(
                  children: [
                    Icon(Iconsax.message, size: 19, color: Color(0xFF444444)),
                    SizedBox(width: 12),
                    Text(
                      'Mark all as unread',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Iconsax.setting,
                size: 19,
                color: Color(0xFF444444),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
