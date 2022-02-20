import 'package:flutter/material.dart';
class PaddingWidget extends StatelessWidget {
  String title;

  PaddingWidget({Key? key,required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title),
      InkWell(
        child: Container(),
      )
    ],);
  }
}
