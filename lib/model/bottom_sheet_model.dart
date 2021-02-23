import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Colors.pink),
  Destination('Booking', Icons.book_online, Colors.pink),
  Destination('Support', Icons.question_answer_outlined, Colors.pink),
];
