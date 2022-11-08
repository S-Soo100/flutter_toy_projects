import 'package:flutter/material.dart';
import 'package:my_practice_app/data/my_signeton.dart';

class SetSingletonScreen extends StatefulWidget {
  static String SetSingletonScreenRouteName = 'setSingletonScreen';
  const SetSingletonScreen({Key? key}) : super(key: key);

  @override
  State<SetSingletonScreen> createState() => _SetSingletonScreenState();
}

class _SetSingletonScreenState extends State<SetSingletonScreen> {
  MySingleton _mySingleton = MySingleton();

  TextEditingController _controller = TextEditingController();
  late Stream<String?> _stream;
  String text = "null";
  @override
  initState() {
    super.initState();
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
              child: Text("Current Singleton value is..."),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Text(_mySingleton.userIdString ?? ""),
            ),
            Container(
              width: 180,
              child: TextFormField(
                controller: _controller,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _mySingleton.setCurrentUser(uid: _controller.text);
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
