import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/data/dummy/event_category_data.dart';
import 'package:hobitix/data/dummy/event_data.dart';
import 'package:hobitix/models/event_model.dart';
import 'package:hobitix/shared/widgets/home/category_chip.dart';
import 'package:hobitix/shared/widgets/home/featured_event_carousel.dart';
import 'package:hobitix/shared/widgets/home/home_app_bar.dart';
import 'package:hobitix/shared/widgets/home/large_event_card.dart';
import 'package:hobitix/shared/widgets/home/small_event_card.dart';
import 'package:hobitix/shared/widgets/home/upcoming_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategoryId = 'all';

  List<EventModel> get filteredEvents {
    if (selectedCategoryId == 'all') {
      return dummyEvents;
    }

    return dummyEvents.where((event) {
      return event.categoryId == selectedCategoryId;
    }).toList();
  }

  void selectCategory(String categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayedEvents = filteredEvents;

    return Scaffold(
      appBar: const HomeAppBar(),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 18),
                child: FeaturedEventCarousel(events: displayedEvents),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 42,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: eventCategories.length,
                  itemBuilder: (context, index) {
                    final category = eventCategories[index];

                    return CategoryChip(
                      title: category.name,
                      selected: selectedCategoryId == category.id,
                      onTap: () {
                        selectCategory(category.id);
                      },
                    );
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: UpcomingHeader(
                onViewAll: () {
                  context.go('/explore?category=$selectedCategoryId');
                },
              ),
            ),

            if (displayedEvents.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: Text('No events found in this category'),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final event = displayedEvents[index];

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
                  }, childCount: displayedEvents.length),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
