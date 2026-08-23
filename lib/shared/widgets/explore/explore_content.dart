import 'package:flutter/material.dart';
import 'package:hobitix/shared/widgets/explore/interest_section.dart';
import 'package:hobitix/shared/widgets/explore/trending_section.dart';

class ExploreContent extends StatelessWidget {
  const ExploreContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(child: TrendingSection()),

        SliverToBoxAdapter(child: InterestSection()),

        SliverToBoxAdapter(child: SizedBox(height: 30)),
      ],
    );
  }
}
