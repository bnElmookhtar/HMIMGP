import 'package:get/get.dart';
import 'package:hmimgp/src/repositry/auth_repo/auth_repo.dart';

class DeleteAccountController extends GetxController {

  static DeleteAccountController get instance=>Get.find();

  Future<String> deleteCurrentAccount() async {
   return await AuthenticationRepository.instance.deleteAccount();
  }
}
