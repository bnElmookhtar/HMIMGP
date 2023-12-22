import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  String msgWhenSignUp = "";
  String msgWhenSignIn = "";
  String msgWhenDeletingAccount = "";

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
   // ever(firebaseUser, _setInitialScreen);
  }
  //
  //
  // _setInitialScreen(User? user) {
  //   user == null ? Get.offAll(() => Splash()) : Get.offAll(HomeLayout());
  // }



  //sign up
  Future<String> createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      msgWhenSignUp = e.code;
    } catch (_) {
      print("another err in sign up${_}");
    }
    return msgWhenSignUp;
  }

  //sign in with email and password
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("code is -------------> ${e.code}");
      msgWhenSignIn = e.code;
    } catch (_) {
      print("another err ${_.toString()}");
    }
    return msgWhenSignIn;
  }

  //log out
  Future<void> logout() async => await _auth.signOut();

  //delete account
  Future<String> deleteAccount() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.delete();
      msgWhenDeletingAccount = 'Account deleted successfully';
      } else {
       msgWhenDeletingAccount = 'No user signed in';
      }
    } catch (e) {
      msgWhenDeletingAccount = 'Error deleting account: $e';
    }
    return msgWhenDeletingAccount;
  }


}
