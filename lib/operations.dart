import 'package:flutter/material.dart';

class Operations {

  void deleteNumber(TextEditingController tfController) {

    var text = tfController.text;

    // Yazının son harfini sil
    var newText = text.substring(0, text.length - 1);

    tfController.text = newText;
  }

  void checkOperationIcon(TextEditingController tfController, String icon) {

    var text = tfController.text;
    var control = text.substring(text.length - 1);

    // Yazının son harfinde aritmetik operatör simgesi varsa bir daha simge koyma
    if(control == "+" || control == "-" || control == "*" || control == "/") {
      return;
    }

    // Değilse simgeyi koy
    else {
      tfController.text += icon;
    }
  }

  void checkPlusMinus(TextEditingController tfController) {

    var text = tfController.text;
    var plusMinus = text.substring(0, 1);

    // Yazının başında - varsa kaldır
    if(plusMinus == "-") {
      tfController.text = text.substring(1, text.length);
    }

    // Yazının başında - yoksa koy.
    else if(plusMinus != "-") {
      tfController.text = "-$text";
    }
  }
}