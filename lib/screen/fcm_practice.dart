import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_practice_app/controller/app_controller.dart';
import 'package:my_practice_app/widgets/too_lazy_to_make_appbar.dart';

class FcmPractice extends StatelessWidget {
  static String fcmPractice = 'fcmPractice';
  FcmPractice({Key? key}) : super(key: key);
  final AppController c = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: TooLazyToMakeAppbar(context: context, title: 'FCM'),
        body: FutureBuilder(
          future: c.initialize(), // 여기서 앱 실행 전에 해야 하는 초기화 진행
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('title', style: TextStyle(fontSize: 20)),
                  Text('message', style: TextStyle(fontSize: 15)),
                ],
              ));
            } else if (snapshot.hasError) {
              return const Center(child: Text('failed to initialize'));
            } else {
              return const Center(child: Text('initializing...'));
            }
          },
        ),
      ),
    );
  }
}
