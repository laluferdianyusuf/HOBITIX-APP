import 'package:flutter/material.dart';
import 'package:hobitix/models/ticket_model.dart';
import 'package:hobitix/shared/widgets/tickets/ticket_card.dart';

class PastTickets extends StatelessWidget {
  const PastTickets();

  @override
  Widget build(BuildContext context) {
    final tickets = [
      const TicketData(
        id: "1",
        imageUrl:
            'https://images.unsplash.com/photo-1492684223066-81342ee5ff30',
        title: 'Summer Music Festival',
        date: 'Aug 15, 2024',
        time: '7:00 PM',
        location: 'Central Park',
        type: 'SEAT',
        value: 'B-120',
      ),
      const TicketData(
        id: "2",
        imageUrl: 'https://images.unsplash.com/photo-1561214115-f2f134cc4912',
        title: 'Art & Design Exhibition',
        date: 'Jul 21, 2024',
        time: '11:00 AM',
        location: 'National Art Center',
        type: 'ENTRY',
        value: 'General',
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      itemCount: tickets.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        return TicketCard(ticket: tickets[index], isPast: true);
      },
    );
  }
}
