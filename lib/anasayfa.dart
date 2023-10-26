import 'package:flutter/material.dart';
import 'package:flutter_hesap_makinesi/islemler.dart';
import 'package:flutter_hesap_makinesi/sayi_buton.dart';

class Anasayfa extends StatefulWidget {

  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var tfController = TextEditingController();
  var islem = Islemler();

  int toplam = 0;
  late var sayilar;

  // sonuç var mı kontrolü
  bool sonuc = false;

  // Yazılan sayıları ve sonucu temizle
  void sifirla() {

    tfController.text = "";
    toplam = 0;

    sonuc = false;
  }

  // Toplama işlemini yap
  void hesapla() {

    sonuc = true;
    toplam = 0;
    var text = tfController.text;

    // + simgesini gördükçe sayıları dizi içine aktar
    sayilar = text.split("+");

    // her bir sayıyı toplam değişkenine aktar
    for(var i=0; i<sayilar.length; i++) {
      toplam += int.parse(sayilar[i]);
    }
  }

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
                    // Sonuç varsa texti göster, sonuç yoksa gösterme
                    visible: sonuc,
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
                      SayiButon(sayi: "7", tfController: tfController),
                      SayiButon(sayi: "8", tfController: tfController),
                      SayiButon(sayi: "9", tfController: tfController),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("\u232b"),
                        onPressed: () {
                          islem.sayiSil(tfController);
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
                      SayiButon(sayi: "4", tfController: tfController),
                      SayiButon(sayi: "5", tfController: tfController),
                      SayiButon(sayi: "6", tfController: tfController),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("C"),
                        onPressed: () {
                          setState(() {
                            sifirla();
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
                      SayiButon(sayi: "1", tfController: tfController),
                      SayiButon(sayi: "2", tfController: tfController),
                      SayiButon(sayi: "3", tfController: tfController),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("+"),
                        onPressed: () {
                          islem.toplaSimgesiKontrol(tfController);
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
                          islem.artiEksiKontrol(tfController);
                        },
                      ),
                      SayiButon(sayi: "0", tfController: tfController),
                      SayiButon(sayi: "00", tfController: tfController),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.yellow,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("="),
                        onPressed: () {
                          setState(() {
                            hesapla();
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