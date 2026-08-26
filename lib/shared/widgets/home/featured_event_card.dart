import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/models/event_model.dart';
import 'package:iconsax/iconsax.dart';

class FeaturedEventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;

  const FeaturedEventCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/event/${event.id}');
      },
      child: Container(
        height: 191,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(event.image, fit: BoxFit.cover),

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

                  Text(
                    event.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      height: 1.05,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Row(
                    children: [
                      Icon(Iconsax.calendar, size: 10, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        event.date,
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  Row(
                    children: [
                      Icon(Iconsax.location, size: 11, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        event.location,
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
                        Icon(
                          Iconsax.arrow_right,
                          size: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
