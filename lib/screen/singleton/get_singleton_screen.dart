import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_practice_app/data/my_signeton.dart';
// import 'package:rxdart/rxdart.dart';

class GetSingletonScreen extends StatefulWidget {
  static String GetSingletonScreenRouteName = 'getSingletonScreen';
  const GetSingletonScreen({Key? key}) : super(key: key);

  @override
  State<GetSingletonScreen> createState() => _GetSingletonScreenState();
}

class GetSingleTonViewModel extends GetxController {
  final Rx<String?> _userId = Rx(null);
  String? get userId => _userId.value;
  MySingleton mySingleton = MySingleton.instance;

  @override
  void onInit() {
    super.onInit();

    _userId.bindStream(mySingleton.userIdStream);
  }
}

class _GetSingletonScreenState extends State<GetSingletonScreen> {
  late GetSingleTonViewModel viewModel;
  @override
  initState() {
    super.initState();
    Get.put(GetSingleTonViewModel());
    viewModel = Get.find<GetSingleTonViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: const Text("Current Singleton value is"),
          ),
          Obx(() {
            return Container(
              margin: const EdgeInsets.all(16),
              child: Text(
                viewModel.userId ?? "",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          }),
        ]),
      ),
    );
  }
}
