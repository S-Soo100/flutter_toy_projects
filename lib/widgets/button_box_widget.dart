import 'package:flutter/material.dart';

class ButtonBoxWidget extends StatelessWidget {
  ButtonBoxWidget({
    required BuildContext context,
    required this.buttonName,
    required this.onPressed,
    this.height,
  });
  final double? height;
  final String buttonName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 450,
        height: height ?? 130,
        decoration: const BoxDecoration(
          color: Color(0xff434343),
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
