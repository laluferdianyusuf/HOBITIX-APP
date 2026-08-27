import 'package:flutter/material.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/models/ticket_model.dart';
import 'package:hobitix/shared/widgets/tickets/secondary_button.dart';
import 'package:hobitix/shared/widgets/tickets/ticket_detail_app_bar.dart';
import 'package:hobitix/shared/widgets/tickets/ticket_detail_card.dart';
import 'package:hobitix/shared/widgets/tickets/wallet_button.dart';
import 'package:iconsax/iconsax.dart';

class TicketDetailsPage extends StatelessWidget {
  final TicketData ticket;

  const TicketDetailsPage({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: const TicketDetailAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(ticket.imageUrl, fit: BoxFit.cover),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 130,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, AppColors.background],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Transform.translate(
              offset: const Offset(0, -110),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: TicketDetailCard(ticket: ticket),
              ),
            ),

            Transform.translate(
              offset: const Offset(0, -94),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  children: [
                    WalletButton(),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            icon: Iconsax.share,
                            label: 'Share Ticket',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: SecondaryButton(
                            icon: Iconsax.routing,
                            label: 'Directions',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
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
