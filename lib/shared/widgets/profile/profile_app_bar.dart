import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

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
        child: _IconButton(
          icon: Iconsax.search_normal,
          onTap: () {
            debugPrint("Search");
          },
        ),
      ),

      title: const Text(
        "Hobitix",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Color(0xFF4B36D8),
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: _IconButton(
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

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 19, color: const Color(0xFF444444)),
      ),
    );
  }
}
