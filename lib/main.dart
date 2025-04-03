import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
import 'package:iteacher/core/services/firebase_options.dart';
import 'package:iteacher/core/services/sf_service.dart';
import 'package:iteacher/core/utils/helper/simple_bloc_obsever.dart';
import 'package:iteacher/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterWindowManagerPlus.addFlags(FlutterWindowManagerPlus.FLAG_SECURE);
  await SharedPreferencesService.init();
  Bloc.observer = SimpleBlocObServer();
  runApp(MyApp());
}
