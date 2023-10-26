import 'package:flutter/material.dart';

class Islemler {

  void sayiSil(TextEditingController tfController) {

    var text = tfController.text;
    var newText = text.substring(0, text.length - 1);

    tfController.text = newText;
  }

  void toplaSimgesiKontrol(TextEditingController tfController) {

    var text = tfController.text;
    var kontrol = text.substring(text.length - 1);

    if(kontrol == "+") {
      return;
    }

    else {
      tfController.text += "+";
    }
  }

  void artiEksiKontrol(TextEditingController tfController) {

    var text = tfController.text;
    var plusMinus = text.substring(0, 1);

    if(plusMinus == "-") {
      tfController.text = text.substring(1, text.length);
    }

    else if(plusMinus != "-") {
      tfController.text = "-$text";
    }
  }
}