import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repositry/auth_repo/auth_repo.dart';

class SignUpController extends GetxController{
  static SignUpController get instance=>Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final username = TextEditingController();


  Future<String> registerUser(String email,String password)async{

    String  msg = await AuthenticationRepository.instance.createUser(email, password);
    return msg;
  }

}