import 'package:hive/hive.dart';

class HiveUserStore {
  static final HiveUserStore instance = HiveUserStore._();

  late var box;

  userBoxOpen() async {
    box = await Hive.openBox('testBox');
  }

  HiveUserStore._() {
    userBoxOpen();
  }

  // factory HiveUserStore() {
  //   return instance;
  // }
}
