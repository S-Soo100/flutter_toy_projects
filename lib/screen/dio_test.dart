import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_practice_app/widgets/button_box_widget.dart';
import 'package:my_practice_app/widgets/too_lazy_to_make_appbar.dart';

class DioTest extends StatefulWidget {
  static String DioTestRouteName = 'dioTest';
  DioTest({Key? key}) : super(key: key);

  @override
  State<DioTest> createState() => _DioTestState();
}

class _DioTestState extends State<DioTest> {
  var dio = Dio();

  String data = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //i am
      appBar: TooLazyToMakeAppbar(
        //and i will just code..
        title: 'dio practice',
        context: context,
      ),
      body: Column(
        children: [
          ButtonBoxWidget(
            context: context,
            buttonName: 'Dio Get',
            onPressed: () {
              getGoogle();
            },
          ),
          Text(
            data,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Future<void> getGoogle() async {
    var dio = Dio();
    final response = await dio.get('https://google.com');
    print(response.data);
    setState(() {
      data = response.data;
    });
  }
}
