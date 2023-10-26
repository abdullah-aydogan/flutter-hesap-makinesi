import 'package:flutter/material.dart';

class Islemler {

  void sayiSil(TextEditingController tfController) {

    var text = tfController.text;

    // Yazının son harfini sil
    var newText = text.substring(0, text.length - 1);

    tfController.text = newText;
  }

  void toplaSimgesiKontrol(TextEditingController tfController) {

    var text = tfController.text;
    var kontrol = text.substring(text.length - 1);

    // Yazının son harfinde + simgesi varsa bir daha + simgesi koyma
    if(kontrol == "+") {
      return;
    }

    // Değilse + simgesini koy
    else {
      tfController.text += "+";
    }
  }

  void artiEksiKontrol(TextEditingController tfController) {

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