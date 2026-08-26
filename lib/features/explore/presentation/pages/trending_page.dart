import 'package:flutter/material.dart';
import 'package:hobitix/shared/widgets/trending/trending_app_bar.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const TrendingAppBar());
  }
}
