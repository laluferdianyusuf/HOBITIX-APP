import 'package:flutter/material.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quantity',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff34343A),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Choose how many tickets',
                  style: TextStyle(fontSize: 8, color: Color(0xff9999A0)),
                ),
              ],
            ),
          ),

          QuantityButton(
            icon: Iconsax.minus,
            enabled: quantity > 1,
            onTap: onDecrease,
          ),

          SizedBox(
            width: 38,
            child: Center(
              child: Text(
                '$quantity',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          QuantityButton(icon: Iconsax.add, enabled: true, onTap: onIncrease),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: enabled
                ? AppColors.primary.withValues(alpha: .08)
                : const Color(0xffF4F4F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 14,
            color: enabled ? AppColors.primary : const Color(0xffBDBDC3),
          ),
        ),
      ),
    );
  }
}
