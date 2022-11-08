import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_practice_app/data/my_signeton.dart';

class SetSingletonScreen extends StatefulWidget {
  static String SetSingletonScreenRouteName = 'setSingletonScreen';
  const SetSingletonScreen({Key? key}) : super(key: key);

  @override
  State<SetSingletonScreen> createState() => _SetSingletonScreenState();
}

class SetSingleTonViewModel extends GetxController {
  final Rx<String?> _userId = Rx(null);
  String? get userId => _userId.value;
  MySingleton mySingleton = MySingleton.instance;

  @override
  void onInit() {
    super.onInit();
    _userId.bindStream(mySingleton.userIdStream);
  }

  void setCurrentUser({required String uid}) {
    mySingleton.setCurrentUser(uid: uid);
  }
}

class _SetSingletonScreenState extends State<SetSingletonScreen> {
  final TextEditingController _controller = TextEditingController();
  late SetSingleTonViewModel viewModel;
  @override
  initState() {
    super.initState();
    Get.put(SetSingleTonViewModel());
    viewModel = Get.find<SetSingleTonViewModel>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: const Text("Current Singleton value is..."),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Text(viewModel.userId ?? ""),
            ),
            SizedBox(
              width: 180,
              child: TextFormField(
                controller: _controller,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    viewModel.setCurrentUser(uid: _controller.text);
                    _controller.clear();
                  });
                },
                child: const Text('Set Singleton')),
          ],
        ),
      ),
    );
  }
}
