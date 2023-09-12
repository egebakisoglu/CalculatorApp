import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorModel {
  const CalculatorModel({this.input = "", this.currentOperation = "", this.result = 0.0});

  final String input;
  final String currentOperation;
  final double result;

  CalculatorModel copyWith({String? input, String? currentOperation, double? result}) {
    return CalculatorModel(
      input: input ?? this.input,
      currentOperation: currentOperation ?? this.currentOperation,
      result: result ?? this.result,
    );
  }
}

final calculatorProvider = StateNotifierProvider<CalculatorNotifier, CalculatorModel>((ref) {
  return CalculatorNotifier();
});

class CalculatorNotifier extends StateNotifier<CalculatorModel> {
  CalculatorNotifier() : super(CalculatorModel());

  void appendNumber(String number) {
    state = state.copyWith(input: state.input + number);
  }

  void clearInput() {
    state = state.copyWith(input: "");
  }

  void clearLastInput() {
    state = state.copyWith(input: state.input.substring(0, state.input.length - 1));
  }
}