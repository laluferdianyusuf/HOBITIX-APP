import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/models/event_model.dart';
import 'package:hobitix/shared/widgets/home/category_chip.dart';
import 'package:hobitix/shared/widgets/home/featured_event_card.dart';
import 'package:hobitix/shared/widgets/home/featured_event_carousel.dart';
import 'package:hobitix/shared/widgets/home/home_app_bar.dart';
import 'package:hobitix/shared/widgets/home/large_event_card.dart';
import 'package:hobitix/shared/widgets/home/small_event_card.dart';
import 'package:hobitix/shared/widgets/home/upcoming_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<EventModel> get events => const [
    EventModel(
      id: "1",
      image:
          "https://images.unsplash.com/photo-1511192336575-5a79af67a629"
          "?auto=format&fit=crop&w=500&q=85",
      category: "ARTS & CULTURE",
      date: "Sep 12",
      title: "Modern Art Expo: The Indigo Phase",
      location: "City Contemporary Gallery",
      price: "\$25.00",
    ),

    EventModel(
      id: "2",
      image:
          "https://images.unsplash.com/photo-1511192336575-5a79af67a629"
          "?auto=format&fit=crop&w=500&q=80",
      category: "MUSIC",
      date: "Fri, Oct 4",
      title: "Midnight Jazz Sessions",
      location: "The Blue Note",
      price: "\$48.00",
    ),

    EventModel(
      id: "3",
      image:
          "https://images.unsplash.com/photo-1531058020387-3be344556be6"
          "?auto=format&fit=crop&w=500&q=80",
      category: "TECH",
      date: "Nov 12-14",
      title: "Future Innovators Summit",
      location: "Convention Center",
      price: "\$80.00",
    ),

    EventModel(
      id: "4",
      image:
          "https://images.unsplash.com/photo-1540039155733-5bb30b53aa14"
          "?auto=format&fit=crop&w=500&q=80",
      category: "SPORTS",
      date: "Dec 8",
      title: "Urban Sports Festival",
      location: "Downtown Arena",
      price: "\$35.00",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 12, 20, 18),
                child: FeaturedEventCarousel(events: events),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 42,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryChip(title: "Music", selected: true),
                    CategoryChip(title: "Arts"),
                    CategoryChip(title: "Tech"),
                    CategoryChip(title: "Sports"),
                    CategoryChip(title: "Food"),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: UpcomingHeader(
                onViewAll: () {
                  debugPrint("View all clicked");
                },
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final event = events[index];

                  if (index == 0) {
                    return LargeEventCard(
                      event: event,
                      onTap: () {
                        context.push('/event/${event.id}', extra: event);
                      },
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SmallEventCard(
                      event: event,
                      onTap: () {
                        context.push('/event/${event.id}', extra: event);
                      },
                    ),
                  );
                }, childCount: events.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
