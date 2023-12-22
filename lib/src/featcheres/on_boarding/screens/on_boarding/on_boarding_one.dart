import 'package:flutter/material.dart';
import 'package:hmimgp/src/btn_functions/navigation.dart';
import 'package:hmimgp/src/common_widgets/app_cover.dart';
import 'package:hmimgp/src/common_widgets/btn.dart';
import 'package:hmimgp/src/common_widgets/floating_action_btn.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/lengths/fonts_size.dart';
import 'package:hmimgp/src/constants/strings/app_strings/on_boaring_splash.dart';
import 'package:hmimgp/src/featcheres/on_boarding/screens/on_boarding/on_boarding_two.dart';
import 'package:hmimgp/src/featcheres/on_boarding/screens/welcome.dart';
import '../../../../constants/lengths/margines_paddings.dart';

class OnBoardingOne extends StatelessWidget {
  OnBoardingOne({super.key});

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
                      top: paddingHeight(context, 0.1),
                      right: paddingWidth(context, 0.1),
                      child: elevatedBtn(
                          context: context,
                          width: gWidth(context, 0.15),
                          height: gHeight(context, 0.1),
                          btnFunction: () {
                            navToWithReplace(context: context, nextPage: Welcome());
                          },
                          btnText: skip,
                          btnColor: deepBlue),
                    ),
                    Positioned(
                      top: paddingHeight(context, 0.4),
                      left:  paddingWidth(context, 0.001),

                        child: Text(
                          onBoardingPhraseOne,
                          style: TextStyle(
                            fontSize: small_1,
                            color: white,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                    ),
                    Positioned(
                        bottom: paddingHeight(context, 0.1),
                        right: paddingWidth(context, 0.1),
                        child: floatingActionButton(context, OnBoardingTwo()),
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
