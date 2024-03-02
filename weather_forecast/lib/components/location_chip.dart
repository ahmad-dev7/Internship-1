import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationChip extends StatelessWidget {
  final String cityName, countryCode;
  const LocationChip({
    super.key,
    required this.cityName,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xFF669EE2),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      labelPadding: const EdgeInsetsDirectional.only(start: 4, end: 0),
      shape: const StadiumBorder(
        side: BorderSide(color: Colors.orange),
      ),
      elevation: 10,
      deleteIcon: const Icon(
        Icons.pin_drop,
        color: Colors.white,
      ),
      onDeleted: () => '',
      label: RichText(
        text: TextSpan(
          text: cityName,
          style: GoogleFonts.aBeeZee(
            color: const Color(0xF8FFFFFF),
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: .5,
          ),
          children: [
            const TextSpan(text: '  '),
            TextSpan(
              text: countryCode,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
