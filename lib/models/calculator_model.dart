import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorModel {
  String input = "0";
  String currentOperation = "";
  double result = 0.0;
}

final calculatorProvider = StateNotifierProvider<CalculatorNotifier, CalculatorModel>((ref) {
  return CalculatorNotifier();
});

class CalculatorNotifier extends StateNotifier<CalculatorModel> {
  CalculatorNotifier() : super(CalculatorModel());

  void appendNumber(String number) {
    state.input += number;
  }

  void clearInput() {
    state.input = "";
  }

  void clearLastInput() {
    state.input = state.input.substring(0, state.input.length - 1);
  }
}