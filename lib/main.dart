import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/core/utils/services/firebase_options.dart';
import 'package:mrjoo/core/utils/services/simple_bloc_obsever.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';
import 'package:mrjoo/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObServer();
  await Hive.initFlutter();
  Hive.registerAdapter<MessageModel>(MessageModelAdapter());
  await Hive.openBox<MessageModel>(AppKeys.kMessageBox);
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<UserModel>(AppKeys.kUserBox);
  runApp(const MrJoo());
}
