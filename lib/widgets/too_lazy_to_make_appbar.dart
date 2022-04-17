import 'package:flutter/material.dart';

AppBar TooLazyToMakeAppbar(
    {required BuildContext context, required String title}) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, 'home', (route) => false);
          },
          icon: const Icon(Icons.home))
    ],
  );
}
