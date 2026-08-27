import 'package:flutter/material.dart';

class TicketInfo extends StatelessWidget {
  final String label;
  final String value;
  final CrossAxisAlignment alignment;

  const TicketInfo({
    super.key,

    required this.label,
    required this.value,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: Colors.grey.shade500,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
