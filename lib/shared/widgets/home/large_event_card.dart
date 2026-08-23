import 'package:flutter/material.dart';
import 'package:hobitix/models/event_model.dart';
import 'package:iconsax/iconsax.dart';

class LargeEventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;

  const LargeEventCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 128,
              width: double.infinity,
              child: Image.network(event.image, fit: BoxFit.cover),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                children: [
                  Text(
                    event.category,
                    style: const TextStyle(
                      color: Color(0xFF513DE2),
                      fontSize: 7,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                    ),
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      event.date,
                      style: const TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 0),
              child: Text(
                event.title,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.location,
                    size: 11,
                    color: Color(0xFF777777),
                  ),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      event.location,
                      style: const TextStyle(
                        fontSize: 8,
                        color: Color(0xFF777777),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(height: 1, color: const Color(0xFFEDEDF0)),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Starting from",
                        style: TextStyle(fontSize: 7, color: Color(0xFF777777)),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        event.price,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Container(
                    width: 31,
                    height: 31,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F2FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Iconsax.shopping_cart,
                      size: 15,
                      color: Color(0xFF513DE2),
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
