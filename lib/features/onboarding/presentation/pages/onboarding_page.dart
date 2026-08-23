import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/core/storage/app_storage.dart';
import 'package:hobitix/models/onboarding_model.dart';
import 'package:hobitix/shared/widgets/onboarding/onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingData> _pages = const [
    OnboardingData(
      image:
          'https://images.unsplash.com/photo-1492684223066-81342ee5ff30'
          '?auto=format&fit=crop&w=900&q=80',
      title: 'Discover Amazing Events',
      description:
          'Find concerts, festivals, exhibitions, sports '
          'and many exciting events around you.',
    ),
    OnboardingData(
      image:
          'https://images.unsplash.com/photo-1506157786151-b8491531f063'
          '?auto=format&fit=crop&w=900&q=80',
      title: 'Book Your Tickets',
      description:
          'Get your tickets quickly and securely '
          'without complicated steps.',
    ),
    OnboardingData(
      image:
          'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14'
          '?auto=format&fit=crop&w=900&q=80',
      title: 'Enjoy The Experience',
      description:
          'Make unforgettable memories with '
          'the events you love.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _skip() {
    _finishOnboarding();
  }

  Future<void> _finishOnboarding() async {
    await AppStorage.completeOnboarding();

    if (!mounted) return;

    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: _skip,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF777777),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,

                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },

                itemBuilder: (context, index) {
                  final page = _pages[index];

                  return OnboardingContent(data: page);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
              child: Row(
                children: [
                  Row(
                    children: List.generate(_pages.length, (index) {
                      final selected = index == _currentPage;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.only(right: 6),
                        width: selected ? 24 : 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFF4B36D8)
                              : const Color(0xFFD9D7E5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: _nextPage,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4B36D8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _currentPage == _pages.length - 1
                            ? Icons.check_rounded
                            : Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
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
