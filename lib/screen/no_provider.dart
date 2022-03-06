import 'package:flutter/material.dart';

class NoProviderHome extends StatefulWidget {
  static String ProviderHomeRouteName = 'noProviderHome';

  const NoProviderHome({Key? key}) : super(key: key);

  @override
  State<NoProviderHome> createState() => _NoProviderHomeState();
}

class _NoProviderHomeState extends State<NoProviderHome> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상태가 관리되지 않는 화면'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'home');
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('프로바이더에 의해서 관리되지 않는 상태입니다.'),
              const SizedBox(
                height: 10,
              ),
              Text(
                'count is $_count',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  '뒤로 나갔다 오면 곧바로 초기화 됩니다. \n 심지어 stateFul Widget 을 사용합니다. \n 즉, 숫자가 바뀔 때 마다 새로 빌드 됩니다.'),
            ],
          ),
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: null,
          onPressed: () => {_count--, setState(() {})},
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: null,
          onPressed: () => {_count = 0, setState(() {})},
          child: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: null,
          onPressed: () => {_count++, setState(() {})},
          child: const Icon(Icons.add),
        )
      ]),
    );
  }
}
