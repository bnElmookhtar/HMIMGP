import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmimgp/firebase_options.dart';
import 'package:hmimgp/src/featcheres/on_boarding/screens/splash.dart';
import 'package:hmimgp/src/repositry/auth_repo/auth_repo.dart';
import 'package:hmimgp/src/util/theme/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(()=>AuthenticationRepository());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(Helpers());
}

class Helpers extends StatelessWidget {
  const Helpers({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.darkTheme,
      home:Splash(),
    );
  }
}

