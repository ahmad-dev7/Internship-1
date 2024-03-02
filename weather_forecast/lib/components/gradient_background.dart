import 'dart:ui';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height,
      child: Stack(
        children: [
          Positioned(
            top: screenSize.height / 3,
            left: 0,
            child: Container(
              height: screenSize.height / 3,
              width: screenSize.width / 1.6,
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade700,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: screenSize.height / 3,
            right: 0,
            child: Container(
              height: screenSize.height / 3,
              width: screenSize.width / 1.6,
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade700,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: screenSize.height / 2.5,
              width: screenSize.width - 100,
              decoration: const BoxDecoration(
                color: Color(0xFFFFAB40),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
