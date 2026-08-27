import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/shared/widgets/icon_button.dart';
import 'package:iconsax/iconsax.dart';

class TrendingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrendingAppBar({super.key});

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
              context.pop();
            },
          ),
        ),
      ),

      title: const Text(
        "Trending Now",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Color(0xFF4B36D8),
        ),
      ),
    );
  }
}
