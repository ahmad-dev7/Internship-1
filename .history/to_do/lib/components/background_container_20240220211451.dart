import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height - 245,
      decoration: const BoxDecoration(
        color: Color(0xff313638),
        image: DecorationImage(
          image: AssetImage('images/silver-cloth-abstract-background.jpg'),
          fit: BoxFit.fill,
          opacity: .21,
        ),
      ),
      child: child,
    );
  }
}
