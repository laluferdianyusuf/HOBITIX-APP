import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/features/explore/presentation/pages/interest_event_page.dart';
import 'package:hobitix/features/explore/presentation/pages/trending_page.dart';
import 'package:hobitix/features/home/presentation/pages/event_detail_page.dart';
import 'package:hobitix/features/home/presentation/pages/identity_information_page.dart';
import 'package:hobitix/features/home/presentation/pages/select_ticket_page.dart';
import 'package:hobitix/features/notification/presentation/pages/notification_page.dart';
import 'package:hobitix/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hobitix/features/splash/presentation/pages/splash_page.dart';
import 'package:hobitix/features/tickets/presentation/pages/ticket_details_page.dart';
import 'package:hobitix/models/ticket_model.dart';
import 'package:hobitix/models/ticket_type_mode.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/explore/presentation/pages/explore_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/tickets/presentation/pages/tickets_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',

  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) {
        return const SplashPage();
      },
    ),

    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) {
        return const OnboardingPage();
      },
    ),

    GoRoute(
      path: '/notification',
      name: 'notification',
      builder: (context, state) {
        return const NotificationPage();
      },
    ),

    GoRoute(
      path: '/event/:id',
      name: 'event-detail',
      builder: (context, state) {
        final id = state.pathParameters["id"]!;

        return EventDetailPage(eventId: id);
      },
    ),

    GoRoute(
      path: '/ticket/:id',
      name: 'ticket-detail',
      builder: (context, state) {
        final ticket = state.extra as TicketData;

        return TicketDetailsPage(ticket: ticket);
      },
    ),

    GoRoute(
      path: '/interest/:interest',
      name: 'interest-events',
      builder: (context, state) {
        final interest = state.pathParameters['interest']!;

        return InterestEventsPage(interest: interest);
      },
    ),

    GoRoute(
      path: '/trending',
      name: 'trending',
      builder: (context, state) {
        return TrendingPage();
      },
    ),

    GoRoute(
      path: '/tickets/book',
      name: 'tickets-book',
      builder: (context, state) {
        return SelectTicketPage();
      },
    ),

    GoRoute(
      path: '/identity/fill',
      name: 'identity-fill',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final tickets = extra['tickets'] as List<TicketType>;
        final total = extra['total'] as int;

        return IdentityInformationPage(tickets: tickets, total: total);
      },
    ),

    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return MainShell(navigationShell: navigationShell);
          },

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) {
                return const HomePage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/explore',
              name: 'explore',
              builder: (context, state) {
                return const ExplorePage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tickets',
              name: 'tickets',
              builder: (context, state) {
                return const TicketsPage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) {
                return const ProfilePage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,

      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,

        onDestinationSelected: _onDestinationSelected,

        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            selectedIcon: Icon(Iconsax.home_15),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Iconsax.search_normal_1),
            selectedIcon: Icon(Iconsax.search_normal),
            label: 'Explore',
          ),

          NavigationDestination(
            icon: Icon(Iconsax.ticket),
            selectedIcon: Icon(Iconsax.ticket_2),
            label: 'Tickets',
          ),

          NavigationDestination(
            icon: Icon(Iconsax.profile_circle),
            selectedIcon: Icon(Iconsax.profile_circle5),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
