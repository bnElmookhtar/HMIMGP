import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmimgp/src/common_widgets/app_cover.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/lengths/margines_paddings.dart';
import 'package:hmimgp/src/constants/strings/app_strings/on_boaring_splash.dart';

import '../controllers/splash_controller.dart';

class Splash extends StatelessWidget {
  Splash({super.key});
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              Obx(
                () => Container(
                  width: gWidth(context, 0.6),
                  height: gHeight(context, 1),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(seconds: 4),
                        top: paddingHeight(context, 0.4),
                        left: splashController.animate.value ? 16 : -400,
                        curve: Curves.linear,
                        child: AnimatedOpacity(
                          duration: Duration(seconds: 2),
                          opacity: splashController.animate.value ? 1 : 0,
                          child: Text(
                            splashPhrase,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                      Positioned(
                          top: paddingHeight(context, 0.6),
                          left: paddingWidth(context, 0.25),
                          child: Center(
                              child: CircularProgressIndicator(
                            color: white,
                                strokeWidth: 5,
                          ))),
                    ],
                  ),
                ),
              ),
             appCoverContainer(context: context),
            ],
          ),
        ),
      ),
    );
  }
}
