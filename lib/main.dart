import 'package:alison_m1/components/constants.dart';
import 'package:alison_m1/view/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  // await PushNotificationService().setupInteractedMessage();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  GetStorage().write('home_index', "0");
  runApp( GetMaterialApp(
    title: appName,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: SplashScreen(),
  ));
}
