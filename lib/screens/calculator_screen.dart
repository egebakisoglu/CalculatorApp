import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator/models/calculator_model.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CalculatorModel calculatorModel = ref.watch(calculatorProvider);

    final List<String> buttons = [
      "CE", "C", "%", "/",
      "7", "8", "9", "x",
      "4", "5", "6", "-",
      "1", "2", "3", "+",
      "0", "+/-", ",", "="
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              height: 120,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    calculatorModel.input,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 90,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30, right: 10, left: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4
                ),
                shrinkWrap: true,
                itemCount: buttons.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0 || index == 1 || index == 2) {
                    return MyButton(
                      color: Colors.grey[400],
                      textColor: Colors.black,
                      text: buttons[index],
                    );
                  }
                  else if (index == 3 || index == 7 || index == 11 || index == 15 || index == 19){
                    return MyButton(
                      color: Colors.orange,
                      textColor: Colors.white,
                      text: buttons[index],
                    );
                  }
                  return MyButton(
                    color: Colors.grey[900],
                    textColor: Colors.white,
                    text: buttons[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
