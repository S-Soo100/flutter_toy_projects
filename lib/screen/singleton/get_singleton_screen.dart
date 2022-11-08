import 'package:flutter/material.dart';
import 'package:my_practice_app/data/my_signeton.dart';

class GetSingletonScreen extends StatefulWidget {
  static String GetSingletonScreenRouteName = 'getSingletonScreen';
  const GetSingletonScreen({Key? key}) : super(key: key);

  @override
  State<GetSingletonScreen> createState() => _GetSingletonScreenState();
}

class _GetSingletonScreenState extends State<GetSingletonScreen> {
  MySingleton _mySingleton = MySingleton();

  TextEditingController _controller = TextEditingController();
  late Stream<String?> _stream;
  @override
  initState() {
    super.initState();
    _stream = _mySingleton.userId;
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
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(
              _mySingleton.userIdString ?? "",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
