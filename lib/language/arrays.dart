void main() {
  // Its a array of integers
  List<int> integers = [1, 2, 3, 4 , 5];

  // Its a array of integers
  List<double> doubles = [1.1, 2.22, 3.33, 4.44 , 5.55];

  // Its a array of strings
  List<String> fruits = ['apple', 'banana', 'orange'];

  // Its a array of dynamics
  List<dynamic> any = ['apple', 11, 45.9];

  print("Is empty ${integers.isEmpty}");
  print("Not empty ${integers.isNotEmpty}");
  integers.add(6);
  integers.addAll([7, 8, 9 ,10, 11]);
  print("Count ${integers.length}");
  print("Intgers ${integers}");
  print("Item on position five: ${integers[4]}");
  integers.remove(11);
  print("Remove 11 ${integers}");
  integers.removeAt(0);
  print("Remove at position 0 ${integers}");

}