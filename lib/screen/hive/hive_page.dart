import 'package:flutter/material.dart';
import 'package:my_practice_app/screen/hive/hive_store/hive_user_store.dart';

class HivePage extends StatefulWidget {
  static String hivePageRouteName = 'hive';
  const HivePage({Key? key}) : super(key: key);

  @override
  State<HivePage> createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final HiveUserStore _hiveUserStore = HiveUserStore.instance;
  String _hiveValues = '';

  @override
  void initState() {
    super.initState();
    _textEditingController.text = "write Something";
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _hiveUserStore.userBoxOpen();
      _hiveValues = _hiveUserStore.box.values.toString();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Flutter'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 80,
                child: TextFormField(
                  controller: _textEditingController,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _saveInBox();
                },
                child: Container(
                  color: Colors.green,
                  width: 200,
                  height: 80,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              width: 200,
              height: 300,
              child: Text(_hiveValues),
            )
          ],
        ),
      ),
    );
  }

  void _saveInBox() async {
    var _tempHiveBox = _hiveUserStore.box.values;
    print(_tempHiveBox);

    await _hiveUserStore.box
        .put('${_tempHiveBox.length}}', _textEditingController.text);

    print(_tempHiveBox);
    setState(() {
      _hiveValues = "${_tempHiveBox.toString()}";
    });
  }
}
