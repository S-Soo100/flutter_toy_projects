import 'dart:async';
import 'package:rxdart/rxdart.dart';

class MySingleton {
  BehaviorSubject<String?> _controller = BehaviorSubject<String?>();
  Stream<String?> get userIdStream => _controller.stream;
  String? _userId;
  String? get userIdString => _userId;
  //
  static final MySingleton instance = MySingleton._();
  MySingleton._() {
    _controller.add('null');
    _userId = 'null';
  } //private constructor
  //
  // factory MySingleton() {
  //   return instance;
  // }
  //

  void setCurrentUser({required String? uid}) {
    _controller.add(uid);
    _userId = uid;
  }
}
