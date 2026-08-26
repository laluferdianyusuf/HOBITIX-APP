import 'package:flutter/material.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/models/event_model.dart';
import 'package:hobitix/shared/widgets/explore/explore_app_bar.dart';
import 'package:hobitix/shared/widgets/explore/explore_content.dart';
import 'package:hobitix/shared/widgets/explore/explore_filter_bar.dart';
import 'package:hobitix/shared/widgets/explore/search_result_section.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool _isSearching = false;
  String _query = '';
  String? _selectedCategory;
  String? _selectedDate;
  String? _selectedPrice;
  String? _selectedLocation;
  String? _selectedType;

  final List<EventModel> _events = const [
    EventModel(
      id: "1",
      image:
          'https://images.unsplash.com/photo-1492684223066-81342ee5ff30'
          '?auto=format&fit=crop&w=700&q=80',
      category: 'MUSIC',
      date: 'Aug 15-17, 2026',
      title: 'Neon Lights Electronic Festival 2026',
      location: 'Downtown Arena, Main Stage',
      price: '\$80.00',
    ),

    EventModel(
      id: "2",
      image:
          'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14'
          '?auto=format&fit=crop&w=700&q=80',
      category: 'MUSIC',
      date: 'Oct 4, 2026',
      title: 'Neon Dust Music Festival 2026',
      location: 'Downtown Arena',
      price: '\$50.00',
    ),

    EventModel(
      id: "3",
      image:
          'https://images.unsplash.com/photo-1506157786151-b8491531f063'
          '?auto=format&fit=crop&w=700&q=80',
      category: 'LIVE',
      date: 'Oct 12, 2026',
      title: 'Woods & Waves Indie Fest',
      location: 'Forest Park',
      price: '\$40.00',
    ),

    EventModel(
      id: "4",
      image:
          'https://images.unsplash.com/photo-1511192336575-5a79af67a629'
          '?auto=format&fit=crop&w=700&q=80',
      category: 'MUSIC',
      date: 'Oct 20, 2026',
      title: 'Uptown Jazz & Blues',
      location: 'City Hall',
      price: 'Free Entry',
    ),
  ];

  List<EventModel> get _searchResults {
    var results = List<EventModel>.from(_events);

    if (_query.trim().isNotEmpty) {
      final query = _query.trim().toLowerCase();

      results = results.where((event) {
        return event.title.toLowerCase().contains(query) ||
            event.category.toLowerCase().contains(query) ||
            event.location.toLowerCase().contains(query) ||
            event.date.toLowerCase().contains(query);
      }).toList();
    }

    if (_selectedCategory != null) {
      final category = _selectedCategory!.toLowerCase();

      results = results.where((event) {
        return event.category.toLowerCase() == category;
      }).toList();
    }

    if (_selectedPrice != null) {
      final priceFilter = _selectedPrice!;

      results = results.where((event) {
        final price = _parsePrice(event.price);

        if (priceFilter == 'Free') {
          return price == 0;
        }

        if (priceFilter == 'Under \$25') {
          return price < 25;
        }

        if (priceFilter == 'Under \$50') {
          return price < 50;
        }

        if (priceFilter == 'Under \$100') {
          return price < 100;
        }

        return true;
      }).toList();
    }

    if (_selectedLocation != null) {
      final location = _selectedLocation!.toLowerCase();

      results = results.where((event) {
        return event.location.toLowerCase().contains(location);
      }).toList();
    }

    if (_selectedDate != null) {
      results = _filterByDate(results, _selectedDate!);
    }

    return results;
  }

  double _parsePrice(String price) {
    final cleaned = price.replaceAll(RegExp(r'[^0-9.]'), '');

    return double.tryParse(cleaned) ?? 0;
  }

  List<EventModel> _filterByDate(List<EventModel> events, String filter) {
    if (filter == 'This Weekend') {
      return events.where((event) {
        return event.date.contains('Aug') || event.date.contains('Oct');
      }).toList();
    }

    if (filter == 'Today') {
      return events;
    }

    if (filter == 'Tomorrow') {
      return events;
    }

    if (filter == 'This Week') {
      return events;
    }

    if (filter == 'This Month') {
      return events;
    }

    return events;
  }

  void _openSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _closeSearch() {
    setState(() {
      _isSearching = false;
      _query = '';
    });
  }

  void _onSearchChanged(String value) {
    setState(() {
      _query = value;
    });
  }

  void _onCategorySelected(String? category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'More Filters',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: _clearFilters,
                        child: const Text(
                          'Clear all',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4B36D8),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  _filterRow(
                    title: 'Date',
                    options: const [
                      'Today',
                      'Tomorrow',
                      'This Weekend',
                      'This Week',
                      'This Month',
                    ],
                    selected: _selectedDate,
                    onSelected: (value) {
                      setState(() {
                        _selectedDate = value;
                      });

                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 22),

                  _filterRow(
                    title: 'Price',
                    options: const [
                      'Free',
                      'Under \$25',
                      'Under \$50',
                      'Under \$100',
                    ],
                    selected: _selectedPrice,
                    onSelected: (value) {
                      setState(() {
                        _selectedPrice = value;
                      });

                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 22),

                  _filterRow(
                    title: 'Category',
                    options: const ['Music', 'Arts', 'Sports', 'Tech', 'Food'],
                    selected: _selectedCategory,
                    onSelected: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });

                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 22),

                  _filterRow(
                    title: 'Location',
                    options: const ['Downtown', 'Forest', 'City'],
                    selected: _selectedLocation,
                    onSelected: (value) {
                      setState(() {
                        _selectedLocation = value;
                      });

                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 22),

                  _filterRow(
                    title: 'Event Type',
                    options: const ['Online', 'Offline', 'Hybrid'],
                    selected: _selectedType,
                    onSelected: (value) {
                      setState(() {
                        _selectedType = value;
                      });

                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _filterRow({
    required String title,
    required List<String> options,
    required String? selected,
    required ValueChanged<String> onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Color(0xFF333333),
          ),
        ),

        const SizedBox(height: 10),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: options.map((option) {
              final isSelected = selected == option;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => onSelected(option),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFEAE7FF)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFFBDB4FF)
                            : const Color(0xFFE3E1EA),
                      ),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? const Color(0xFF4B36D8)
                            : const Color(0xFF55525F),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _clearFilters() {
    setState(() {
      _selectedCategory = null;
      _selectedDate = null;
      _selectedPrice = null;
      _selectedLocation = null;
      _selectedType = null;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final hasActiveFilter =
        _selectedDate != null ||
        _selectedPrice != null ||
        _selectedCategory != null ||
        _selectedLocation != null ||
        _selectedType != null;

    final showSearchResult =
        _isSearching || _query.trim().isNotEmpty || hasActiveFilter;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ExploreAppBar(
        isSearching: _isSearching,
        onSearchChanged: _onSearchChanged,
        onSearchTap: _openSearch,
        onCloseSearch: _closeSearch,
        onFilterTap: _showFilterOptions,
      ),

      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: ExploreFilterBar(
                selectedDate: _selectedDate,
                selectedPrice: _selectedPrice,
                selectedCategory: _selectedCategory,
                selectedLocation: _selectedLocation,
                selectedType: _selectedType,

                onDateChanged: (value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },

                onPriceChanged: (value) {
                  setState(() {
                    _selectedPrice = value;
                  });
                },

                onCategoryChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },

                onLocationChanged: (value) {
                  setState(() {
                    _selectedLocation = value;
                  });
                },

                onTypeChanged: (value) {
                  setState(() {
                    _selectedType = value;
                  });
                },

                onFilterTap: _showFilterOptions,
              ),
            ),

            if (showSearchResult)
              SearchResultSection(
                events: _searchResults,
                query: _query,
                selectedCategory: _selectedCategory,
                onCategorySelected: _onCategorySelected,
              )
            else
              const ExploreContent(),
          ],
        ),
      ),
    );
  }
}
