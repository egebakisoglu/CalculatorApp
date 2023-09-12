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
      "+/-", "0", ",", "="
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              height: 120,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    calculatorModel.input,
                    style: TextStyle(
                      color: Colors.black,
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
                      color: Colors.pink[600],
                      textColor: Colors.white,
                      text: buttons[index],
                      onTap: () {
                        // 0 = Delete all, 1 = Delete last input, 2 = / 100
                        switch (index) {
                          case 0:
                            ref.read(calculatorProvider.notifier).clearInput();
                            break;
                          case 1:
                            ref.read(calculatorProvider.notifier).clearLastInput();
                            break;
                        }
                      },
                    );
                  }
                  else if (index == 3 || index == 7 || index == 11 || index == 15 || index == 19){
                    return MyButton(
                      color: Colors.yellow[900],
                      textColor: Colors.white,
                      text: buttons[index],
                      onTap: () {
                        // 3 = '/', 7 = 'x', 11 = '-', 15 = '+', 19 = '=',

                      },
                    );
                  }
                  if (index == 16 || index == 18) {
                    return MyButton(
                      color: Colors.blue[900],
                      textColor: Colors.white,
                      text: buttons[index],
                      onTap: () {
                        // 16 = '+/-', 18 = ','

                      },
                    );
                  }
                  return MyButton(
                    color: Colors.blue[700],
                    textColor: Colors.white,
                    text: buttons[index],
                    onTap: () {
                      // number buttons
                      ref.read(calculatorProvider.notifier).appendNumber(buttons[index]);
                    },
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
