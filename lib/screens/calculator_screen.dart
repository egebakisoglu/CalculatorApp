import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator/models/calculator_model.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CalculatorModel calculatorModel = ref.watch(calculatorProvider);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(15),
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              alignment: Alignment.bottomRight,
              height: 85,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    calculatorModel.input,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
