import 'package:flutter/material.dart';
import 'package:my_practice_app/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class ProviderHome extends StatelessWidget {
  static String ProviderHomeRouteName = 'providerHome';

  const ProviderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider로 상태가 관리되는 화면'),
        actions: [

          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'home');
          }, icon: Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('프로바이더에 의해서 관리되는 상태입니다.'),
              const SizedBox(height: 10,),
              Text('count is ${context.watch<Counter>().count}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const Text('뒤로 나갔다 와도 초기화 되지 않습니다.'),
              const Text('count숫자가 Provider에 저장되어 있고, 단순히 읽어옵니다.'),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: null,
             onPressed: () => context.read<Counter>().decrement(),
            child: const Icon(Icons.remove),),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: null,
              onPressed: () => context.read<Counter>().reset(),
              child: const Icon(Icons.refresh),),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: null,
              onPressed: () => context.read<Counter>().increment(),
              child: const Icon(Icons.add),)
          ]
      ),
    );
  }
}