import 'package:flutter/material.dart';

class SayiButon extends StatelessWidget {

  var sayi;
  var tfController = TextEditingController();

  SayiButon({required this.sayi, required this.tfController});

  @override
  Widget build(BuildContext context) {

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        tfController.text += sayi;
      },
      child: Text(sayi),
    );
  }
}