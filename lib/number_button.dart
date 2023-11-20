import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {

  var number;
  var tfController = TextEditingController();

  NumberButton({required this.number, required this.tfController});

  @override
  Widget build(BuildContext context) {

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        tfController.text += number;
      },
      child: Text(number),
    );
  }
}