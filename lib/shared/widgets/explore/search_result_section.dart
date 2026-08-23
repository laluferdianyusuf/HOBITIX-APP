import 'package:flutter/material.dart';
import 'package:hobitix/models/event_model.dart';
import 'package:hobitix/shared/widgets/explore/search_result_card.dart';

class SearchResultSection extends StatelessWidget {
  final List<EventModel> events;
  final String query;
  final String? selectedCategory;
  final ValueChanged<String?> onCategorySelected;

  const SearchResultSection({
    super.key,
    required this.events,
    required this.query,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          const Text(
            'Search Results',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 4),

          Text(
            '${events.length} Results',
            style: const TextStyle(color: Color(0xFF777777), fontSize: 11),
          ),

          const SizedBox(height: 14),

          SizedBox(
            height: 34,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _CategoryChip(
                  title: 'All',
                  selected: selectedCategory == null,
                  onTap: () {
                    onCategorySelected(null);
                  },
                ),

                _CategoryChip(
                  title: 'Music',
                  selected: selectedCategory == 'Music',
                  onTap: () {
                    onCategorySelected('Music');
                  },
                ),

                _CategoryChip(
                  title: 'Arts',
                  selected: selectedCategory == 'Arts',
                  onTap: () {
                    onCategorySelected('Arts');
                  },
                ),

                _CategoryChip(
                  title: 'Tech',
                  selected: selectedCategory == 'Tech',
                  onTap: () {
                    onCategorySelected('Tech');
                  },
                ),

                _CategoryChip(
                  title: 'Sports',
                  selected: selectedCategory == 'Sports',
                  onTap: () {
                    onCategorySelected('Sports');
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          if (events.isEmpty)
            const _EmptyResult()
          else
            ...events.map(
              (event) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SearchResultCard(event: event),
              ),
            ),
        ]),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 7),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4B36D8) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE4E2EA)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF555555),
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _EmptyResult extends StatelessWidget {
  const _EmptyResult();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: Text(
          'No events found',
          style: TextStyle(color: Color(0xFF777777), fontSize: 13),
        ),
      ),
    );
  }
}
