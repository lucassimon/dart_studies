import 'dart:io';

void main() {
  String weight = stdin.readLineSync();
  String height = stdin.readLineSync();

  double bmi = calcBmi(weight, height);
  print(bmi);
  display(bmi);
}

double calcBmi(String weight, String height) => double.parse(weight) / (double.parse(height) * double.parse(height));

void display(double bmi) {
  if (bmi < 18.5) { print("Under weight"); }
  else if (bmi > 18.5 && bmi < 24.9) { print("Normal"); }
  else if (bmi > 25 && bmi < 29.9) { print("Overweight"); }
  else if (bmi > 30 && bmi < 34.9) { print("Grade 1"); }
  else if (bmi > 35 && bmi < 39.9) { print("Grade 2"); }
  else { print("Grade 3"); }
}
