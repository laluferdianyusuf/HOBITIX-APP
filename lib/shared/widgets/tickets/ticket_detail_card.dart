import 'package:flutter/material.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/models/ticket_model.dart';
import 'package:hobitix/shared/widgets/tickets/ticket_info.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketDetailCard extends StatelessWidget {
  final TicketData ticket;

  const TicketDetailCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
        child: Column(
          children: [
            Text(
              ticket.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 7),

            // DATE
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.calendar_1, size: 11, color: AppColors.primary),
                const SizedBox(width: 5),
                Text(
                  '${ticket.date} - ${ticket.time}',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.location, size: 11, color: Colors.grey.shade600),
                const SizedBox(width: 5),
                Text(
                  ticket.location,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: Container(height: 1, color: Colors.grey.shade200),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              width: 250,
              height: 250,
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: QrImageView(
                data: ticket.id,
                version: QrVersions.auto,
                size: 150,
                backgroundColor: Colors.white,
                padding: EdgeInsets.zero,
              ),
            ),

            const SizedBox(height: 13),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TicketInfo(
                    label: 'SECTION / SEAT',
                    value: 'Gen Admin',
                    alignment: CrossAxisAlignment.center,
                  ),
                ),

                Expanded(
                  child: TicketInfo(
                    label: 'TICKET ID',
                    value: '#HX-8921A',
                    alignment: CrossAxisAlignment.center,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Text(
              'TICKET HOLDER',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: Colors.grey.shade500,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              'Alex Rivers',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
