import 'package:flutter/material.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 22),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black.withValues(alpha: .04)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .035),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildThumbnail(),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Indigo Nights Concert',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff17171C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildEventInfo(
                    icon: Iconsax.calendar_1,
                    text: 'Friday, Oct 27 · 8:00 PM',
                  ),
                  const SizedBox(height: 5),
                  _buildEventInfo(
                    icon: Iconsax.location,
                    text: 'The Grand Atrium, NY',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return Container(
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xff15156B), Color(0xff5746E7), Color(0xff101010)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -8,
            top: -8,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: .08),
              ),
            ),
          ),
          const Center(
            child: Icon(Iconsax.music, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildEventInfo({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, size: 12, color: AppColors.primary),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xff777780),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
