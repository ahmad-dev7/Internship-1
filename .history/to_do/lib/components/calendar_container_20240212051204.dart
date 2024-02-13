import 'package:flutter/material.dart';

class CalendarContainer extends StatelessWidget {
  final Widget child;
  const CalendarContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      height: 85,
      decoration: BoxDecoration(
        border: const Border(),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.decal,
          colors: [
            // Color.fromARGB(203, 0, 0, 0),
            // Color.fromARGB(106, 0, 0, 0),
            Color(0xC9272C2E),
            Color(0xC9272C2E),
            // Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          const BoxShadow(
            offset: Offset(-5, -5),
            color: Colors.black,
            blurRadius: 30,
            spreadRadius: -12,
          ),
          BoxShadow(
            offset: const Offset(0, 15),
            color: Colors.grey.shade600,
            blurRadius: 30,
            spreadRadius: -12,
          ),
        ],
      ),
      child: child,
    );
  }
}
