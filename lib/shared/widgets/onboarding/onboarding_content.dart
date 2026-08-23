import 'package:flutter/material.dart';
import 'package:hobitix/models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingData data;

  const OnboardingContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 15),

          // Image
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                data.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Title
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              height: 1.15,
              fontWeight: FontWeight.w800,
              color: Color(0xFF191919),
            ),
          ),

          const SizedBox(height: 14),

          // Description
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              height: 1.6,
              color: Color(0xFF777777),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
