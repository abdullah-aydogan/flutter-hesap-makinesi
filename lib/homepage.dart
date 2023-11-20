import 'package:flutter/material.dart';
import 'package:flutter_hesap_makinesi/operations.dart';
import 'package:flutter_hesap_makinesi/number_button.dart';
import 'package:math_expressions/math_expressions.dart';

class Homepage extends StatefulWidget {

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  var tfController = TextEditingController();
  var operation = Operations();

  double calculateResult = 0.0;

  // sonuç var mı kontrolü
  bool isResult = false;

  // Yazılan sayıları ve sonucu temizle
  void reset() {

    tfController.text = "";
    calculateResult = 0.0;

    isResult = false;
  }

  // Hesaplama işlemini yap
  void calculate() {

    isResult = true;
    calculateResult = 0.0;
    var text = tfController.text;

    // Metni matematiksel ifadeye dönüştür ve hesapla
    Parser p = Parser();
    Expression exp = p.parse(text);
    ContextModel model = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, model);
    calculateResult = eval;
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
                    visible: isResult,
                    child: Text("= ${calculateResult.toString()}", style: const TextStyle(
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
                          foregroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("\u232b"),
                        onPressed: () {
                          operation.deleteNumber(tfController);
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.lightGreen,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("C"),
                        onPressed: () {
                          setState(() {
                            reset();
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
                      NumberButton(number: "7", tfController: tfController),
                      NumberButton(number: "8", tfController: tfController),
                      NumberButton(number: "9", tfController: tfController),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("/"),
                        onPressed: () {
                          operation.checkOperationIcon(tfController, "/");
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
                      NumberButton(number: "4", tfController: tfController),
                      NumberButton(number: "5", tfController: tfController),
                      NumberButton(number: "6", tfController: tfController),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("*"),
                        onPressed: () {
                          operation.checkOperationIcon(tfController, "*");
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
                      NumberButton(number: "1", tfController: tfController),
                      NumberButton(number: "2", tfController: tfController),
                      NumberButton(number: "3", tfController: tfController),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("-"),
                        onPressed: () {
                          operation.checkOperationIcon(tfController, "-");
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
                          foregroundColor: Colors.lightBlue,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("+/-"),
                        onPressed: () {
                          operation.checkPlusMinus(tfController);
                        },
                      ),
                      NumberButton(number: "0", tfController: tfController),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.yellow,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("="),
                        onPressed: () {
                          setState(() {
                            calculate();
                          });
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("+"),
                        onPressed: () {
                          operation.checkOperationIcon(tfController, "+");
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