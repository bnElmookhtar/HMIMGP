import 'package:flutter/material.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/lengths/margines_paddings.dart';

import '../../../../common_widgets/app_cover.dart';
import '../../../../constants/strings/app_strings/register.dart';
import 'sign_in_form.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: offOrange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: gWidth(context, 0.6),
                height: gHeight(context, 1),
                child: Column(
                  children: [
                    Container(
                      width: gWidth(context, 1),
                      height: gHeight(context, 0.2),
                      child: Center(
                        child: Text(
                          signIn,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    Container(
                      height: gHeight(context, 0.5),
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: paddingWidth(context, 0.15),
                      ),
                      child: SignInForm(),
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

