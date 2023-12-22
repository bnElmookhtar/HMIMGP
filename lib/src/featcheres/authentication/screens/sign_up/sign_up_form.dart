import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmimgp/src/btn_functions/navigation.dart';
import 'package:hmimgp/src/common_widgets/scaffold_msg.dart';
import 'package:hmimgp/src/featcheres/authentication/controllers/sign_up_controller.dart';
import 'package:hmimgp/src/featcheres/on_boarding/screens/welcome.dart';
import '../../../../common_widgets/btn.dart';
import '../../../../common_widgets/txt_from_field.dart';
import '../../../../constants/lengths/margines_paddings.dart';
import '../../../../constants/strings/app_strings/register.dart';
import '../../../../constants/strings/app_strings/user_profile.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //email filed
          GenericTextFormField( label: email, controller: signUpController.email,
            validateField: (value){
              if(value.toString().isEmpty)
                return  emailIsEmpty;
            }, maxLength: 40, isPassword: false,
          ),
          //username filed
          GenericTextFormField(
              label: username,
              maxLength: 10,
              controller: signUpController.username,
              validateField: (value){
                if(value.toString().isEmpty)
                  return  usernameIsEmpty;
              }),
          GenericTextFormField(
              label: password,
              maxLength: 10,
              isPassword: true, controller: signUpController.password,
              validateField: (value){
                if(value.toString().isEmpty)
                  return  passwordIsEmpty;
              }),
          GenericTextFormField(
              label: confirmPassword,
              maxLength: 10,
              isPassword: true, controller: signUpController.confirmPassword,
              validateField: (value){
                if(value.toString().isEmpty)
                  return  passwordIsEmpty;
              }),
          //sign up button
          elevatedBtn(
            context: context,
            width: double.infinity,
            height: gHeight(context, 0.08),
            btnFunction: () async{
              if (formKey.currentState!.validate()) {
                if(signUpController.confirmPassword.text.toString() != signUpController.password.text.toString())
                  return scaffoldMsg(msg: "password and confirm password must be the same", context: context);

              String msg = await SignUpController.instance.registerUser(signUpController.email.text.trim(), signUpController.password.text.trim());
              if(msg.isEmpty){
                scaffoldMsg(msg:successSignUpMSg, context: context);
                currentUserEmail = signUpController.email.text.toString();
                currentUserPassword = signUpController.password.text.toString();
                currentUserUsername = signUpController.username.text.toString();
                print("if");
                navToWithReplace(context: context, nextPage: Welcome());
              }
              else if(msgsSignUp.contains(msg)||!(msg.endsWith("@gmail.com"))){
                print("else if $msg");
                scaffoldMsg(msg:msg, context: context);
              }
              else {
                print("else");
                scaffoldMsg(msg:unexpectedErr, context: context);
              }
              }
            },
            btnText: signUp.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
