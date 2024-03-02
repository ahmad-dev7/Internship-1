import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsTile extends StatelessWidget {
  final String heading, info, imagePath;
  const DetailsTile({
    super.key,
    required this.heading,
    required this.info,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width / 2,
      child: Align(
        alignment: Alignment.centerRight,
        child: ListTile(
          title: Text(
            heading,
            style: GoogleFonts.rajdhani(
              color: Colors.white,
              fontWeight: FontWeight.w100,
            ),
          ),
          subtitle: Text(
            info,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          leading: Image.asset(imagePath, height: 35),
        ),
      ),
    );
  }
}
