import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/services/firebase_options.dart';
import 'package:mrjoo/core/services/sf_service.dart';
import 'package:mrjoo/core/utils/helper/simple_bloc_obsever.dart';
import 'package:mrjoo/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesService.init();
  Bloc.observer = SimpleBlocObServer();
  runApp(MyApp());
}
