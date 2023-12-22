import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance=>Get.find();

 /* final _db = FirebaseFirestore.instance;
  
  createUser(UserModel user)async{
   await  _db.collection("Users").add(user.toJson()).whenComplete(() => Get.snackbar("Great", "Add user successfully")).catchError((err,stackTracer){
      Get.snackbar("Error", "field to insert users");
    });
  }*/
}