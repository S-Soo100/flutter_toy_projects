import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart';

class MySingleton {
  BehaviorSubject<String?> _controller = BehaviorSubject<String?>();
  Stream<String?> get userId => _controller.stream;
  String? _userId;
  String? get userIdString => _userId;

  //
  static final MySingleton _instance = MySingleton._();
  MySingleton._() {
    _controller.add('null');
    _userId = 'null';
  } //private constructor
  factory MySingleton() {
    return _instance;
  }
  //
  void setCurrentUser({required String? uid}) {
    _controller.add(uid);
    _userId = uid;
  }
}
