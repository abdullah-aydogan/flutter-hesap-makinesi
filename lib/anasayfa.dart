import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {

  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var tfController = TextEditingController();
  int toplam = 0;
  late var sayilar;

  bool sonuc = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap Makinesi"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: tfController,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: "0",
                      hintStyle: TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                  Visibility(
                    visible: sonuc ? true : false,
                    child: Text("= ${toplam.toString()}", style: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          tfController.text += "7";
                        },
                        child: const Text("7"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("8"),
                        onPressed: () {
                          tfController.text += "8";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("9"),
                        onPressed: () {
                          tfController.text += "9";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("\u232b"),
                        onPressed: () {
                          var text = tfController.text;
                          var newText = text.substring(0, text.length - 1);

                          tfController.text = newText;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("4"),
                        onPressed: () {
                          tfController.text += "4";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("5"),
                        onPressed: () {
                          tfController.text += "5";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("6"),
                        onPressed: () {
                          tfController.text += "6";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("C"),
                        onPressed: () {
                          setState(() {
                            tfController.text = "";
                            toplam = 0;
                            sonuc = false;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("1"),
                        onPressed: () {
                          tfController.text += "1";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("2"),
                        onPressed: () {
                          tfController.text += "2";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("3"),
                        onPressed: () {
                          tfController.text += "3";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("+"),
                        onPressed: () {
                          var text = tfController.text;
                          var kontrol = text.substring(text.length - 1);

                          if(kontrol == "+") {
                            return;
                          }

                          else {
                            tfController.text += "+";
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("+/-"),
                        onPressed: () {
                          var text = tfController.text;
                          var plusMinus = text.substring(0, 1);

                          if(plusMinus == "-") {
                            tfController.text = text.substring(1, text.length);
                          }

                          else if(plusMinus != "-") {
                            tfController.text = "-$text";
                          }
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("0"),
                        onPressed: () {
                          tfController.text += "0";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("00"),
                        onPressed: () {
                          tfController.text += "00";
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.yellow,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("="),
                        onPressed: () {
                          setState(() {
                            sonuc = true;
                            toplam = 0;
                            var text = tfController.text;
                            sayilar = text.split("+");

                            for(var i=0; i<sayilar.length; i++) {
                              toplam += int.parse(sayilar[i]);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}