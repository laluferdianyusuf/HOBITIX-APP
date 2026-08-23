import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UpcomingHeader extends StatelessWidget {
  final VoidCallback? onViewAll;

  const UpcomingHeader({super.key, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 12),
      child: Row(
        children: [
          const Text(
            "Upcoming",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF171717),
            ),
          ),

          const Spacer(),

          GestureDetector(
            onTap: onViewAll,
            child: const Row(
              children: [
                Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4B36D8),
                  ),
                ),
                SizedBox(width: 3),
                Icon(Iconsax.arrow_right4, size: 17, color: Color(0xFF4B36D8)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
