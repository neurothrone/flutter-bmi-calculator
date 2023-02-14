import 'dart:math';

import 'gender.dart';

class CalculatorViewModel {
  Gender selectedGender = Gender.none;
  int height = 183;
  int weight = 74;
  int age = 19;

  double _bmi = 0.0;

  double get bmi => _bmi;

  String get bmiResult {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String get bmiInterpretation {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }

  void calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
  }
}
