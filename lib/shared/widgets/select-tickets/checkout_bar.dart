import 'package:flutter/material.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';

class CheckoutBar extends StatelessWidget {
  final double totalAmount;
  final bool hasTicket;
  final VoidCallback onCheckout;

  const CheckoutBar({
    super.key,
    required this.totalAmount,
    required this.hasTicket,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .07),
            blurRadius: 24,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total amount',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff85858E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Including selected tickets',
                        style: TextStyle(fontSize: 8, color: Color(0xffA5A5AC)),
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.4,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: hasTicket ? onCheckout : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: AppColors.primary.withValues(
                    alpha: .18,
                  ),
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white.withValues(alpha: .7),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hasTicket ? 'Proceed to Checkout' : 'Select a ticket',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (hasTicket) ...[
                      const SizedBox(width: 8),
                      const Icon(Iconsax.arrow_right_3, size: 16),
                    ],
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
