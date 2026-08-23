import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ExploreFilterBar extends StatelessWidget {
  final String? selectedDate;
  final String? selectedPrice;
  final String? selectedCategory;
  final String? selectedLocation;
  final String? selectedType;

  final ValueChanged<String?> onDateChanged;
  final ValueChanged<String?> onPriceChanged;
  final ValueChanged<String?> onCategoryChanged;
  final ValueChanged<String?> onLocationChanged;
  final ValueChanged<String?> onTypeChanged;

  final VoidCallback onFilterTap;

  const ExploreFilterBar({
    super.key,
    this.selectedDate,
    this.selectedPrice,
    this.selectedCategory,
    this.selectedLocation,
    this.selectedType,
    required this.onDateChanged,
    required this.onPriceChanged,
    required this.onCategoryChanged,
    required this.onLocationChanged,
    required this.onTypeChanged,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        physics: const BouncingScrollPhysics(),
        children: [
          _QuickFilterChip(
            label: 'This Weekend',
            selected: selectedDate == 'This Weekend',
            onTap: () {
              onDateChanged(
                selectedDate == 'This Weekend' ? null : 'This Weekend',
              );
            },
          ),

          _QuickFilterChip(
            label: 'Under \$50',
            selected: selectedPrice == 'Under \$50',
            onTap: () {
              onPriceChanged(
                selectedPrice == 'Under \$50' ? null : 'Under \$50',
              );
            },
          ),

          _QuickFilterChip(
            label: 'Free',
            selected: selectedPrice == 'Free',
            onTap: () {
              onPriceChanged(selectedPrice == 'Free' ? null : 'Free');
            },
          ),

          _QuickFilterChip(
            label: 'Music',
            selected: selectedCategory == 'Music',
            onTap: () {
              onCategoryChanged(selectedCategory == 'Music' ? null : 'Music');
            },
          ),

          _QuickFilterChip(
            label: 'Sports',
            selected: selectedCategory == 'Sports',
            onTap: () {
              onCategoryChanged(selectedCategory == 'Sports' ? null : 'Sports');
            },
          ),

          _QuickFilterChip(
            label: 'Arts',
            selected: selectedCategory == 'Arts',
            onTap: () {
              onCategoryChanged(selectedCategory == 'Arts' ? null : 'Arts');
            },
          ),

          _QuickFilterChip(
            label: 'Tech',
            selected: selectedCategory == 'Tech',
            onTap: () {
              onCategoryChanged(selectedCategory == 'Tech' ? null : 'Tech');
            },
          ),

          const SizedBox(width: 4),

          _FilterButton(onTap: onFilterTap),
        ],
      ),
    );
  }
}

class _QuickFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _QuickFilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFEAE7FF) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected
                  ? const Color(0xFFBDB4FF)
                  : const Color(0xFFE3E1EA),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: selected
                  ? const Color(0xFF4B36D8)
                  : const Color(0xFF55525F),
            ),
          ),
        ),
      ),
    );
  }
}

class ActiveFilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const ActiveFilterChip({
    super.key,
    required this.label,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.only(left: 15, right: 8, top: 7, bottom: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFEAE7FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFBDB4FF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B36D8),
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            behavior: HitTestBehavior.opaque,
            child: const Icon(
              Iconsax.close_circle,
              size: 15,
              color: Color(0xFF4B36D8),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final VoidCallback onTap;

  const _FilterButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE3E1EA)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Iconsax.setting_4, size: 16, color: Color(0xFF444444)),
            SizedBox(width: 6),
            Text(
              'Filter',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF444444),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
