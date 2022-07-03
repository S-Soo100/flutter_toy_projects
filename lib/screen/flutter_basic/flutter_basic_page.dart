import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FlutterBasicPage extends StatelessWidget {
  static String flutterBasicPageRouteName = 'flutterBasic';
  const FlutterBasicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(),
    );
  }
}
