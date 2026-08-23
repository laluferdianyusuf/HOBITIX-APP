import 'package:flutter/material.dart';

class InterestSection extends StatelessWidget {
  const InterestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discover by Interest',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _InterestCard(
                  title: 'Nightlife',
                  image:
                      'https://images.unsplash.com/photo-1504150558240-0b4fd8946624'
                      '?auto=format&fit=crop&w=500&q=80',
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _InterestCard(
                  title: 'Family',
                  image:
                      'https://images.unsplash.com/photo-1504150558240-0b4fd8946624'
                      '?auto=format&fit=crop&w=500&q=80',
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: _InterestCard(
                  title: 'Arts',
                  image:
                      'https://images.unsplash.com/photo-1561214115-f2f134cc4912'
                      '?auto=format&fit=crop&w=500&q=80',
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _InterestCard(
                  title: 'Sports',
                  image:
                      'https://images.unsplash.com/photo-1461896836934-ffe607ba8211'
                      '?auto=format&fit=crop&w=500&q=80',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InterestCard extends StatelessWidget {
  final String title;
  final String image;

  const _InterestCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 90,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(image, fit: BoxFit.cover),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.65),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 10,
              bottom: 8,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
