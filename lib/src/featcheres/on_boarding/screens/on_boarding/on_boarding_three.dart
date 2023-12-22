import 'package:flutter/material.dart';
import 'package:hmimgp/src/common_widgets/app_cover.dart';
import 'package:hmimgp/src/common_widgets/floating_action_btn.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/strings/app_strings/on_boaring_splash.dart';
import 'package:hmimgp/src/featcheres/on_boarding/screens/welcome.dart';
import '../../../../constants/lengths/fonts_size.dart';
import '../../../../constants/lengths/margines_paddings.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              Container(
                width: gWidth(context, 0.6),
                height: gHeight(context, 1),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: paddingHeight(context, 0.4),
                      left: paddingWidth(context, 0.001),
                      child: Container(
                        child: Text(
                            onBoardingPhraseThree,
                            style: TextStyle(color: white,fontSize: small_1),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                      ),

                    ),
                    Positioned(
                        bottom: paddingHeight(context, 0.1),
                        right: paddingWidth(context, 0.1),
                        child:floatingActionButton(context, Welcome()),
                    ),
                  ],
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
