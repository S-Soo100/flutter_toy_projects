import 'package:flutter/material.dart';

class ButtonBoxWidget extends StatelessWidget {
  const ButtonBoxWidget(
      {Key? key, required this.buttonName, required this.onPressed})
      : super(key: key);

  final String buttonName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 450,
        decoration: BoxDecoration(
          color: const Color(0xff434343),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonName,
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}