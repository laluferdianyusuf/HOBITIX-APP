import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/shared/widgets/icon_button.dart';
import 'package:iconsax/iconsax.dart';

class SelectTicketPage extends StatefulWidget {
  const SelectTicketPage({super.key});

  @override
  State<SelectTicketPage> createState() => _SelectTicketPageState();
}

class _SelectTicketPageState extends State<SelectTicketPage> {
  int? _selectedTicketIndex;

  final List<_TicketType> _tickets = [
    _TicketType(
      name: 'General Admission',
      description: 'Standard entry to the main floor.',
      price: 85,
      quantity: 0,
      color: Colors.transparent,
    ),
    _TicketType(
      name: 'VIP Experience',
      description: 'Early entry, private bar access, and commemorative poster.',
      price: 150,
      quantity: 0,
      color: Colors.blueAccent,
    ),
    _TicketType(
      name: 'Early Bird',
      description: 'Limited early bird ticket.',
      price: 65,
      quantity: 0,
      soldOut: true,
      color: Colors.transparent,
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

  List<_TicketType> get selectedTickets {
    return _tickets.where((ticket) => ticket.quantity > 0).toList();
  }

  void _selectTicket(int index) {
    if (_tickets[index].soldOut) return;

    setState(() {
      _selectedTicketIndex = index;

      for (int i = 0; i < _tickets.length; i++) {
        if (i != index) {
          _tickets[i].quantity = 0;
        }
      }

      if (_tickets[index].quantity == 0) {
        _tickets[index].quantity = 1;
      }
    });
  }

  void _removeTicket(int index) {
    final ticket = _tickets[index];

    if (ticket.quantity <= 0) return;

    setState(() {
      ticket.quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: AppIconButton(
          icon: Iconsax.arrow_left,
          onTap: () {
            context.pop();
          },
        ),
        title: const Text(
          'Select Ticket',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      bottomNavigationBar: _buildBottomCheckout(),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildEventHeader()),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            sliver: SliverList.builder(
              itemCount: _tickets.length,
              itemBuilder: (context, index) {
                return _buildTicketCard(ticket: _tickets[index], index: index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 74,
                height: 58,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff15156B),
                      Color(0xff5746E7),
                      Color(0xff101010),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Iconsax.musicnote,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Indigo Nights Concert',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      Icon(
                        Iconsax.calendar_1,
                        size: 11,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Friday, Oct 27 · 8:00 PM',
                        style: TextStyle(fontSize: 9.5, color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 11,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'The Grand Atrium, NY',
                        style: TextStyle(fontSize: 9.5, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard({required _TicketType ticket, required int index}) {
    final bool isSoldOut = ticket.soldOut;
    final bool isSelected = _selectedTicketIndex == index;

    return GestureDetector(
      onTap: () => _selectTicket(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),

          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: isSelected
                        ? Container(
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          )
                        : null,
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      ticket.name,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isSoldOut ? Colors.grey : Colors.black87,
                      ),
                    ),
                  ),

                  Text(
                    '\$${ticket.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: isSoldOut ? Colors.grey : AppColors.primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  ticket.description,
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.35,
                    color: isSoldOut
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
                  ),
                ),
              ),

              if (isSoldOut) ...[
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(.08),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Sold Out',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],

              if (isSelected && !isSoldOut) ...[
                const SizedBox(height: 12),

                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Quantity',
                    style: TextStyle(fontSize: 9, color: Colors.grey),
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _QuantityButton(
                      icon: Iconsax.minus,
                      enabled: ticket.quantity > 1,
                      onTap: () {
                        setState(() {
                          ticket.quantity--;
                        });
                      },
                    ),

                    SizedBox(
                      width: 35,
                      child: Center(
                        child: Text(
                          '${ticket.quantity}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    _QuantityButton(
                      icon: Iconsax.add,
                      enabled: true,
                      onTap: () {
                        setState(() {
                          ticket.quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomCheckout() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                Text(
                  '\$${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton(
                onPressed: totalTickets == 0
                    ? null
                    : () {
                        // Navigate to checkout
                        //
                        // context.push(
                        //   '/checkout',
                        //   extra: {
                        //     'event': widget.event,
                        //     'tickets': _tickets,
                        //     'total': totalAmount,
                        //   },
                        // );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: AppColors.primary.withOpacity(.35),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Proceed to Checkout',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Iconsax.arrow_right_3, size: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 27,
          height: 27,
          decoration: BoxDecoration(
            color: enabled ? const Color(0xffF7F7FA) : const Color(0xffF4F4F4),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 13,
            color: enabled ? AppColors.primary : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}

class _TicketType {
  final String name;
  final String description;
  final double price;
  final bool soldOut;
  final Color color;
  int quantity;

  _TicketType({
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 0,
    this.soldOut = false,
    required this.color,
  });
}
