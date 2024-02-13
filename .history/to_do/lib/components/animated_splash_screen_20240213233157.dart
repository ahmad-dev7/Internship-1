import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do/Services/task_services.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/pages/name_page.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  navigateUser() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            userInfo.isEmpty ? const GetUserName() : const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'images/splash_animation.json',
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(navigateUser);
        },
      ),
    );
  }
}
