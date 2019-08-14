import 'dart:io';

void main() {
  String weight = stdin.readLineSync();
  String height = stdin.readLineSync();

  double imc = double.parse(weight) / (double.parse(height) * double.parse(height));
  
  if (imc < 18.5) { print("Abaixo do peso"); }
  else if (imc > 18.5 && imc < 24.9) { print("Normal"); }
  else if (imc > 25 && imc < 29.9) { print("Sobrepeso"); }
  else if (imc > 30 && imc < 34.9) { print("Obsedidade grau 1"); }
  else if (imc > 35 && imc < 39.9) { print("Obsedidade grau 2"); }
  else { print("Obsedidade grau 3"); }
}