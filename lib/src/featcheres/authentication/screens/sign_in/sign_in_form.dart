import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmimgp/src/btn_functions/navigation.dart';
import 'package:hmimgp/src/common_widgets/scaffold_msg.dart';
import 'package:hmimgp/src/featcheres/authentication/controllers/sign_in_controller.dart';
import 'package:hmimgp/src/featcheres/home_layout/home_layout.dart';
import '../../../../common_widgets/btn.dart';
import '../../../../common_widgets/txt_from_field.dart';
import '../../../../constants/lengths/margines_paddings.dart';
import '../../../../constants/strings/app_strings/register.dart';
import '../../../../constants/strings/app_strings/user_profile.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GenericTextFormField( label: email, controller: controller.email,
              validateField: (value){
            if(value.toString().isEmpty)
              return  emailIsEmpty;
          }, maxLength: 40, isPassword: false,
          ),
          GenericTextFormField(
              label: username,
              maxLength: 10,
              controller: controller.username,
              validateField: (value){
                if(value.toString().isEmpty)
                  return  usernameIsEmpty;
              }),
          GenericTextFormField(
              label: password,
              maxLength: 10,
              isPassword: true,
              controller: controller.password,
              validateField: (value){
                if(value.toString().isEmpty)
                  return  passwordIsEmpty;
              }),
          elevatedBtn(
              context: context,
              width: double.infinity,
              height: gHeight(context, 0.08),
              btnFunction: ()async {
                if(_formKey.currentState!.validate()) {
                  String msg = await SignInController.instance.signInUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());
                  if(msg.isEmpty){
                    scaffoldMsg(msg: successLoginMSg, context: context,);
                    currentUserEmail = controller.email.text.toString();
                    currentUserPassword = controller.password.text.toString();
                    currentUserUsername = controller.username.text.toString();
                    navToWithReplace(context: context, nextPage: HomeLayout());
                  }
                  else if (msgsSignIn.contains(msg)) {
                    scaffoldMsg(msg: msg, context: context,);
                  }
                  else
                    scaffoldMsg(msg: unexpectedErr, context: context);
                }
                 },
              btnText: signIn.toUpperCase()),

        ],
      ),
    );
  }
}
