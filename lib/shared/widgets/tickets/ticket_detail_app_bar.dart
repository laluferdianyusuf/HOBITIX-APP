import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:hobitix/shared/widgets/icon_button.dart';

class TicketDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TicketDetailAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: Colors.transparent,
      centerTitle: false,

      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: AppIconButton(
            icon: Iconsax.arrow_left,
            onTap: () => context.pop(),
          ),
        ),
      ),
    );
  }
}
