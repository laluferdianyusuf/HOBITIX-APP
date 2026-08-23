import 'package:flutter/material.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/models/notification_model.dart';
import 'package:hobitix/shared/widgets/notification/filter_chips.dart';
import 'package:hobitix/shared/widgets/notification/notification_app_bar.dart';
import 'package:hobitix/shared/widgets/notification/notification_card.dart';
import 'package:iconsax/iconsax.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String selectedFilter = 'All';

  final List<AppNotification> notifications = [
    AppNotification(
      title: "Your tickets for Neon Nights are ready!",
      message: "View them in 'My Tickets'.",
      time: "10 min ago",
      type: NotificationType.events,
      icon: Iconsax.ticket,
      isUnread: true,
    ),
    AppNotification(
      title: "Electric Nights starts in 2 hours.",
      message: "Don't forget your QR code!",
      time: "2h ago",
      type: NotificationType.events,
      icon: Iconsax.calendar,
      isUnread: true,
    ),
    AppNotification(
      title: "New Jazz events added in Downtown.",
      message: "Check them out!",
      time: "5h ago",
      type: NotificationType.events,
      icon: Iconsax.magic_star,
      isUnread: false,
    ),
    AppNotification(
      title: "Price dropped for 'Modern Art Expo'!",
      message: "Now starting from \$20.",
      time: "1d ago",
      type: NotificationType.updates,
      icon: Iconsax.tag,
      isUnread: false,
    ),
  ];

  List<AppNotification> get filteredNotifications {
    if (selectedFilter == 'All') {
      return notifications;
    }

    if (selectedFilter == 'Events') {
      return notifications
          .where((notification) => notification.type == NotificationType.events)
          .toList();
    }

    return notifications
        .where((notification) => notification.type == NotificationType.updates)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotificationAppBar(),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
                child: FilterChips(
                  selectedFilter: selectedFilter,
                  onFilterChanged: (filter) {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              sliver: SliverList.separated(
                itemCount: filteredNotifications.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final notification = filteredNotifications[index];

                  return NotificationCard(
                    notification: notification,
                    onTap: () {
                      setState(() {
                        notification.isUnread = false;
                      });

                      debugPrint('Notification tapped: ${notification.title}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
