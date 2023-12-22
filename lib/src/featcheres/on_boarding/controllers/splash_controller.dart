import 'package:get/get.dart';
import 'package:hmimgp/src/featcheres/on_boarding/screens/on_boarding/on_boarding_one.dart';

class SplashController extends GetxController{
  //create object from the class
  static SplashController get find=>Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds:  2));
    Get.to(OnBoardingOne());
  }
}