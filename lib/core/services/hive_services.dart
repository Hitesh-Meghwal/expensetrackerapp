import 'package:expensetrackerapp/features/auth/data/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveServices {
  static Box<UserModel> get userBox => Hive.box<UserModel>('users');

  static Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();

    //register adapter
    Hive.registerAdapter(UserModelAdapter());

    //open Hive boxes
    await Hive.openBox<UserModel>('users');
  }
}
