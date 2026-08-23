import 'package:flutter/material.dart';

class TrendingEventCard extends StatelessWidget {
  const TrendingEventCard({super.key});

  static const images = [
    'https://images.unsplash.com/photo-1492684223066-81342ee5ff30'
        '?auto=format&fit=crop&w=600&q=80',
    'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14'
        '?auto=format&fit=crop&w=600&q=80',
    'https://images.unsplash.com/photo-1506157786151-b8491531f063'
        '?auto=format&fit=crop&w=600&q=80',
    'https://images.unsplash.com/photo-1511192336575-5a79af67a629'
        '?auto=format&fit=crop&w=600&q=80',
  ];

  static const titles = [
    'Neon Lights Electronic Festival 2026',
    'Modern Music Festival',
    'Summer Live Concert',
    'Uptown Jazz Festival',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                images[0],
                height: 125,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B36D8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'FEATURED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'AUG 15 - AUG 17',
                  style: TextStyle(
                    color: Color(0xFF4B36D8),
                    fontSize: 7,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  titles[0],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 3),

                const Text(
                  'Downtown Arena',
                  style: TextStyle(fontSize: 8, color: Color(0xFF777777)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
