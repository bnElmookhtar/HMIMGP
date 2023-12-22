import 'package:flutter/material.dart';
import 'package:hmimgp/src/btn_functions/navigation.dart';
import 'package:hmimgp/src/common_widgets/btn.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/lengths/margines_paddings.dart';
import 'package:hmimgp/src/constants/strings/image_paths.dart';
import 'package:hmimgp/src/featcheres/authentication/screens/sign_in/sign_in.dart';
import 'package:hmimgp/src/featcheres/authentication/screens/sign_up/sign_up.dart';

import '../../../constants/strings/app_strings/register.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(

          width: gWidth(context, 1),
          height: gHeight(context, 1),
          decoration: BoxDecoration( color: offOrange.withOpacity(0.001),
              image: DecorationImage(
            image: AssetImage(
              facultyImgOne,
            ),
            fit: BoxFit.cover,
            opacity: 0.6,
          )),
          child: Center(
            child: Container(
              width: gWidth(context, 0.6),
              height: gHeight(context, 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  elevatedBtn(
                      context: context,
                      width: gWidth(context, 0.25),
                      height: gHeight(context, 1),
                      btnFunction: () {
                        navToWithReplace(context: context, nextPage: SignIn());
                      },
                      btnText: signIn,
                    btnColor: white.withOpacity(0.4),
                    txtColor: deepBlue
                  ),
                  elevatedBtn(
                      context: context,
                      width: gWidth(context, 0.25),
                      height: gHeight(context, 1),
                      btnFunction: () {
                        navToWithReplace(context: context, nextPage: SignUp());
                      },
                      btnText: signUp,   btnColor: white.withOpacity(0.8),txtColor: deepBlue)
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
