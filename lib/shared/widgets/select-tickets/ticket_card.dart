import 'package:flutter/material.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/models/ticket_type_mode.dart';
import 'package:hobitix/shared/widgets/select-tickets/quantity_selector.dart';
import 'package:iconsax/iconsax.dart';

class TicketCard extends StatelessWidget {
  final TicketType ticket;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const TicketCard({
    super.key,
    required this.ticket,
    required this.isSelected,
    required this.onTap,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    final isSoldOut = ticket.soldOut;

    return GestureDetector(
      onTap: isSoldOut ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSoldOut
              ? const Color(0xffFAFAFB)
              : isSelected
              ? AppColors.primary.withValues(alpha: .035)
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            width: isSelected ? 1.4 : 1,
            color: isSelected
                ? AppColors.primary
                : Colors.black.withValues(alpha: .045),
          ),
          boxShadow: [
            if (!isSoldOut)
              BoxShadow(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: .08)
                    : Colors.black.withValues(alpha: .025),
                blurRadius: isSelected ? 18 : 12,
                offset: const Offset(0, 6),
              ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SelectionIndicator(selected: isSelected, soldOut: isSoldOut),
                const SizedBox(width: 12),
                Expanded(child: _buildTicketInfo(isSoldOut)),
              ],
            ),

            if (isSoldOut) ...[
              const SizedBox(height: 12),
              const _SoldOutBadge(),
            ],

            if (isSelected && !isSoldOut) ...[
              const SizedBox(height: 16),
              QuantitySelector(
                quantity: ticket.quantity,
                onDecrease: onDecrease,
                onIncrease: onIncrease,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTicketInfo(bool isSoldOut) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                ticket.name,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isSoldOut
                      ? const Color(0xffA0A0A7)
                      : const Color(0xff17171C),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '\$${ticket.price.toStringAsFixed(0)}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: isSoldOut ? const Color(0xffA0A0A7) : AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          ticket.description,
          style: TextStyle(
            fontSize: 10,
            height: 1.45,
            color: isSoldOut
                ? const Color(0xffAFAFB5)
                : const Color(0xff7E7E87),
          ),
        ),
      ],
    );
  }
}

class _SelectionIndicator extends StatelessWidget {
  final bool selected;
  final bool soldOut;

  const _SelectionIndicator({required this.selected, required this.soldOut});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? AppColors.primary : Colors.transparent,
        border: Border.all(
          width: selected ? 0 : 1.5,
          color: soldOut
              ? const Color(0xffD6D6DA)
              : selected
              ? AppColors.primary
              : const Color(0xffD0D0D5),
        ),
      ),
      child: selected
          ? const Icon(Icons.check, size: 13, color: Colors.white)
          : null,
    );
  }
}

class _SoldOutBadge extends StatelessWidget {
  const _SoldOutBadge();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xffFFF1F1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Iconsax.close_circle, size: 11, color: Color(0xffE05252)),
            SizedBox(width: 5),
            Text(
              'Sold Out',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: Color(0xffE05252),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
