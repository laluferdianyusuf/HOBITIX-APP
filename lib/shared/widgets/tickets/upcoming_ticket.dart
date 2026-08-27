import 'package:flutter/material.dart';
import 'package:hobitix/models/ticket_model.dart';
import 'package:hobitix/shared/widgets/tickets/ticket_card.dart';

class UpcomingTickets extends StatelessWidget {
  const UpcomingTickets();

  @override
  Widget build(BuildContext context) {
    final tickets = [
      const TicketData(
        id: "1",
        imageUrl:
            'https://images.unsplash.com/photo-1501386761578-eac5c94b800a',
        title: 'Neon Nights Festival',
        date: 'Oct 24, 2024',
        time: '8:00 PM',
        location: 'Downtown Arena, Block C',
        type: 'SEAT',
        value: 'GA-104',
      ),
      const TicketData(
        id: "2",
        imageUrl: 'https://images.unsplash.com/photo-1549490349-8643362247b5',
        title: 'Modern Art Expo 2024',
        date: 'Nov 02, 2024',
        time: '10:00 AM',
        location: 'City Gallery Museum',
        type: 'ENTRY',
        value: 'VIP Pass',
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      itemCount: tickets.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        return TicketCard(ticket: tickets[index]);
      },
    );
  }
}
