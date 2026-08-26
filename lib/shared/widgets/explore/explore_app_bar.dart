import 'package:flutter/material.dart';
import 'package:hobitix/shared/widgets/icon_button.dart';
import 'package:iconsax/iconsax.dart';

class ExploreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSearching;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchTap;
  final VoidCallback onCloseSearch;
  final VoidCallback onFilterTap;

  const ExploreAppBar({
    super.key,
    required this.isSearching,
    required this.onSearchChanged,
    required this.onSearchTap,
    required this.onCloseSearch,
    required this.onFilterTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF8F8FA),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,

      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Center(
          child: AppIconButton(
            icon: isSearching ? Iconsax.arrow_left : Iconsax.search_normal,
            onTap: isSearching ? onCloseSearch : onSearchTap,
          ),
        ),
      ),

      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axis: Axis.horizontal,
              child: child,
            ),
          );
        },

        child: isSearching
            ? Container(
                key: const ValueKey('search'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE5E3EC)),
                ),
                child: TextField(
                  autofocus: true,
                  onChanged: onSearchChanged,
                  textInputAction: TextInputAction.search,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF333333),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Search events...',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF999999),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 9,
                    ),
                  ),
                ),
              )
            : const Text(
                'Explore',
                key: ValueKey('title'),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4B36D8),
                ),
              ),
      ),

      centerTitle: true,

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: AppIconButton(icon: Iconsax.setting_3, onTap: onFilterTap),
        ),
      ],
    );
  }
}
