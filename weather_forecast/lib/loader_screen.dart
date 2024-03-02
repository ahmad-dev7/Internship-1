import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast/components/gradient_background.dart';
import 'package:weather_forecast/controller/animation_controller.dart';
import 'package:weather_forecast/controller/data_controller.dart';
import 'package:weather_forecast/home_page.dart';

class ShowLoader extends StatelessWidget {
  const ShowLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = Get.put(MyAnimationController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const GradientBackground(),
          Center(
            child: Lottie.asset(
              'images/loading_animation.json',
              controller: myController.animationController,
              onLoaded: (composition) => myAnimationPlayer(
                composition,
                myController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  myAnimationPlayer(var composition, MyAnimationController myController) {
    myController.animationController
      ..duration = composition.duration
      ..forward().whenComplete(
        () {
          if (controller.receivedData.value == true) {
            Get.offAll(
              const HomePage(),
              transition: Transition.cupertinoDialog,
              duration: const Duration(seconds: 2),
            );
          } else {
            myController.animationController.reset();
            myAnimationPlayer(composition, myController);
          }
        },
      );
  }
}
