import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FeaturedEventCard extends StatelessWidget {
  const FeaturedEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 191,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1511192336575-5a79af67a629"
            "?auto=format&fit=crop&w=1200&q=80",
            fit: BoxFit.cover,
          ),

          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.05),
                  Colors.black.withValues(alpha: 0.30),
                  Colors.black.withValues(alpha: 0.88),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5038E8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "FEATURED EVENT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                const Spacer(),

                const Text(
                  "Neon Dreams\nMusic Festival",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    height: 1.05,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 7),

                const Row(
                  children: [
                    Icon(Iconsax.calendar, size: 10, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      "Aug 15 - 17, 2024",
                      style: TextStyle(color: Colors.white, fontSize: 9),
                    ),
                  ],
                ),

                const SizedBox(height: 3),

                const Row(
                  children: [
                    Icon(Iconsax.location, size: 11, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      "Downtown Park Arena",
                      style: TextStyle(color: Colors.white, fontSize: 9),
                    ),
                  ],
                ),

                const SizedBox(height: 9),

                Container(
                  height: 29,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5740E8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Secure Tickets",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Iconsax.arrow_right, size: 12, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
