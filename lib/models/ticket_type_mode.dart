import 'package:flutter/painting.dart';

class TicketType {
  final String name;
  final String description;
  final double price;
  final bool soldOut;
  final Color? accentColor;

  int quantity;

  TicketType({
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 0,
    this.soldOut = false,
    this.accentColor,
  });
}
