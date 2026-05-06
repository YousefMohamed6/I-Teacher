import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:iteacher/core/utils/helper/app_initializer.dart';
import 'package:iteacher/firebase_options.dart';
import 'package:iteacher/my_app.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AppInitializer().init();
  FlutterNativeSplash.remove();
  runApp(MyApp());
}
