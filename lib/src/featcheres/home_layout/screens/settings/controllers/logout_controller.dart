import 'package:get/get.dart';
import 'package:hmimgp/src/repositry/auth_repo/auth_repo.dart';

class LogOutController extends GetxController {

  static LogOutController get instance=>Get.find();

  Future<void> logOut() async {
   return await AuthenticationRepository.instance.logout();
  }
}
