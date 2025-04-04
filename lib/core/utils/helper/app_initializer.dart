import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
import 'package:iteacher/core/services/firebase_options.dart';
import 'package:iteacher/core/services/loacl_notification_service.dart';
import 'package:iteacher/core/services/sf_service.dart';
import 'package:iteacher/core/utils/helper/simple_bloc_obsever.dart';

class AppInitializer {
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await ScreenUtil.ensureScreenSize();
    await FlutterWindowManagerPlus.addFlags(
        FlutterWindowManagerPlus.FLAG_SECURE);
    await SharedPreferencesService.init();
    NotificationService().initNotification();
    Bloc.observer = SimpleBlocObServer();
  }
}
