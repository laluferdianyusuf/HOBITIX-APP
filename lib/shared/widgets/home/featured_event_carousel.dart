import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/models/event_model.dart';
import 'package:hobitix/shared/widgets/home/featured_event_card.dart';

class FeaturedEventCarousel extends StatelessWidget {
  final List<EventModel> events;

  const FeaturedEventCarousel({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: events.length,
      itemBuilder: (context, index, realIndex) {
        final event = events[index];

        return FeaturedEventCard(
          event: event,
          onTap: () {
            context.pushNamed(
              'event-detail',
              pathParameters: {'id': event.id},
              extra: event,
            );
          },
        );
      },
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1,
        enlargeCenterPage: true,
        enlargeFactor: 0.12,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 700),
        autoPlayCurve: Curves.easeInOut,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
