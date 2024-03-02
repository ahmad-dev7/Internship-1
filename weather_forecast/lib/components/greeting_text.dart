import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      getGreeting(),
      style: GoogleFonts.acme(
        fontSize: 25,
        letterSpacing: .9,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  String getGreeting() {
    DateTime dateTime = DateTime.now();
    int time = int.parse(DateFormat.H().format(dateTime));
    if (time >= 22 || time <= 4) {
      return 'Good Night';
    } else if (time > 4 || time <= 12) {
      return 'Good Morning';
    } else if (time > 12 || time <= 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
