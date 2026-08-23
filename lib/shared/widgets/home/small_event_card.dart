import 'package:flutter/material.dart';
import 'package:hobitix/models/event_model.dart';

class SmallEventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;

  const SmallEventCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 81,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.035),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            SizedBox(
              width: 79,
              height: double.infinity,
              child: Image.network(event.image, fit: BoxFit.cover),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(9, 8, 8, 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.category,
                      style: const TextStyle(
                        fontSize: 6.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF513DE2),
                        letterSpacing: 0.6,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      event.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      "${event.date} • ${event.location}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 7,
                        color: Color(0xFF777777),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 9),
              child: Text(
                event.price,
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF444444),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
