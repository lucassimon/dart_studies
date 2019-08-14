import 'dart:io';

void main() {
  bool isTrue = 1 > 0;
  if (isTrue) { print("true"); }
  else { print("false"); }
  
  isTrue = 1 != 0;
  if (isTrue) { print("true"); }
  else { print("false"); }

  isTrue = 1 == 0;
  if (isTrue) { print("true"); }
  else { print("false"); }

  isTrue = 1 >= 0;
  if (isTrue) { print("true"); }
  else { print("false"); }

  isTrue = 1 <= 0;
  if (isTrue) { print("true"); }
  else { print("false"); }

  // input data
  print("Enter your age:");
  String input = stdin.readLineSync();
  int age = int.parse(input);
  if (age >= 50) { print("elder"); }
  else if (age > 25) { print("adult"); }
  else if (age > 12) { print("younger"); }
  else { print("child"); }

}