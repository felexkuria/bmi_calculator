import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalculatorBrain({this.height, this.weight});

  String calculateBmi() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi < 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight .try to exercise more';
    } else if (_bmi < 18.5) {
      return 'You have a normal body weight .Good Job !!';
    } else {
      return 'You have a Lower than normal body weight .You Can eat a bit more';
    }
  }
}
