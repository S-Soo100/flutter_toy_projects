import 'package:flutter/material.dart';

class ProviderHome extends StatelessWidget {
  static const String ProviderHomeRouteName = 'providerHome';

  const ProviderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Practice'),
        actions: [

          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'home');
          }, icon: Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Text('아휴'),
            ],
          ),
        ),
      ),
    );
  }
}