import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

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

  bool canOperate = true;

  void appendNumber(String number) {
    state = state.copyWith(input: state.input + number, currentOperation: state.currentOperation + number);
    canOperate = true;
  }

  void clearInput() {
    state = state.copyWith(input: "", currentOperation: "");
    canOperate = true;
  }

  void clearLastInput() {
    state = state.copyWith(input: state.input.substring(0, state.input.length - 1), currentOperation: state.currentOperation.substring(0, state.currentOperation.length - 1));
  }

  void setOperation(String operation) {
    if (canOperate && state.input == "") {
      operation = operation.replaceAll("x", "*");
      state = state.copyWith(input: "",
          currentOperation: operation == "."
              ? "${state.currentOperation}$operation"
              : operation == "*" || operation == "/" || operation == "%"
                  ? "(${state.currentOperation}) $operation "
                  : "${state.currentOperation} $operation "
      );
      canOperate = false;
    }
  }

  void showResult() {
    if (canOperate) {
      ContextModel cm = ContextModel();
      Parser p = Parser();
      Expression exp = p.parse(state.currentOperation);
      state = state.copyWith(
          input: exp.evaluate(EvaluationType.REAL, cm).toString(),
          currentOperation: state.currentOperation);
    }
  }
}