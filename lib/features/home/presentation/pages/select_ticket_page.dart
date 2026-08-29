import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/models/ticket_type_mode.dart';
import 'package:hobitix/shared/widgets/icon_button.dart';
import 'package:hobitix/shared/widgets/select-tickets/checkout_bar.dart';
import 'package:hobitix/shared/widgets/select-tickets/event_header.dart';
import 'package:hobitix/shared/widgets/select-tickets/ticket_card.dart';
import 'package:iconsax/iconsax.dart';

class SelectTicketPage extends StatefulWidget {
  const SelectTicketPage({super.key});

  @override
  State<SelectTicketPage> createState() => _SelectTicketPageState();
}

class _SelectTicketPageState extends State<SelectTicketPage> {
  int? _selectedTicketIndex;

  final List<TicketType> _tickets = [
    TicketType(
      name: 'General Admission',
      description: 'Standard entry to the main floor.',
      price: 85000,
    ),
    TicketType(
      name: 'VIP Experience',
      description: 'Early entry, private bar access, and commemorative poster.',
      price: 150000,
      accentColor: const Color(0xff6352E8),
    ),
    TicketType(
      name: 'Early Bird',
      description: 'Limited early bird ticket.',
      price: 65000,
      soldOut: true,
    ),
  ];

  double get totalAmount {
    return _tickets.fold(
      0,
      (sum, ticket) => sum + (ticket.price * ticket.quantity),
    );
  }

  int get totalTickets {
    return _tickets.fold(0, (sum, ticket) => sum + ticket.quantity);
  }

  void _selectTicket(int index) {
    final ticket = _tickets[index];

    if (ticket.soldOut) return;

    setState(() {
      _selectedTicketIndex = index;

      for (int i = 0; i < _tickets.length; i++) {
        if (i != index) {
          _tickets[i].quantity = 0;
        }
      }

      if (ticket.quantity == 0) {
        ticket.quantity = 1;
      }
    });
  }

  void _decreaseQuantity() {
    if (_selectedTicketIndex == null) return;

    final ticket = _tickets[_selectedTicketIndex!];

    if (ticket.quantity <= 1) return;

    setState(() {
      ticket.quantity--;
    });
  }

  void _increaseQuantity() {
    if (_selectedTicketIndex == null) return;

    final ticket = _tickets[_selectedTicketIndex!];

    setState(() {
      ticket.quantity++;
    });
  }

  void _proceedToCheckout() {
    if (totalTickets == 0) return;

    context.pushNamed(
      'identity-fill',
      extra: {
        'tickets': _tickets.where((ticket) => ticket.quantity > 0).toList(),
        'total': totalAmount,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      bottomNavigationBar: CheckoutBar(
        totalAmount: totalAmount,
        hasTicket: totalTickets > 0,
        onCheckout: _proceedToCheckout,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: EventHeader()),

          SliverToBoxAdapter(child: _buildSectionHeader()),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverList.builder(
              itemCount: _tickets.length,
              itemBuilder: (context, index) {
                final ticket = _tickets[index];

                return TicketCard(
                  ticket: ticket,
                  isSelected: _selectedTicketIndex == index,
                  onTap: () => _selectTicket(index),
                  onDecrease: _decreaseQuantity,
                  onIncrease: _increaseQuantity,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffF7F7FA),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: AppIconButton(
            icon: Iconsax.arrow_left,
            onTap: () => context.pop(),
          ),
        ),
      ),
      title: const Text(
        'Select Tickets',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          letterSpacing: -.2,
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your ticket',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff17171C),
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Select one ticket type to continue',
                  style: TextStyle(fontSize: 10, color: Color(0xff8B8B94)),
                ),
              ],
            ),
          ),
          if (totalTickets > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: .08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$totalTickets ticket${totalTickets > 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
