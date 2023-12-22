import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hmimgp/src/repositry/auth_repo/auth_repo.dart';

class SignInController extends GetxController{
  static SignInController get instance=>Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();

  Future<String> signInUser(String email,String password)async{
  return await AuthenticationRepository.instance.signInWithEmailAndPassword(email, password);
  }

}