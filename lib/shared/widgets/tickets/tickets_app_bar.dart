import 'package:flutter/material.dart';
import 'package:hobitix/shared/widgets/icon_button.dart';
import 'package:iconsax/iconsax.dart';

class TicketsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TicketsAppBar({super.key});

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
        child: AppIconButton(
          icon: Iconsax.search_normal,
          onTap: () {
            debugPrint("Search");
          },
        ),
      ),

      title: const Text(
        "My Tickets",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Color(0xFF4B36D8),
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: AppIconButton(
            icon: Iconsax.notification,
            onTap: () {
              debugPrint("Notification");
            },
          ),
        ),
      ],
    );
  }
}
