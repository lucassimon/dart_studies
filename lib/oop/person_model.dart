class Person {
  String name;
  int age;
  double weight;
  double height;

  Person({this.name, this.age, this.weight, this.height});

  double bmi() => double.parse((this.weight / (this.height * this.height)).toStringAsFixed(2));

  String categoryByAge () {
    if (this.age >= 50) { return "Old"; }
    else if (this.age > 25) { return "Adult"; }
    else if (this.age > 12) { return "Younger"; }
    
    return "Child";
  }

  String obesity() {
    double bmi = this.bmi();
    if (bmi < 18.5) { return "Under weight"; }
    else if (bmi > 18.5 && bmi < 24.9) { return "Normal"; }
    else if (bmi > 25 && bmi < 29.9) { return "Overweight"; }
    else if (bmi > 30 && bmi < 34.9) { return "Grade 1"; }
    else if (bmi > 35 && bmi < 39.9) { return "Grade 2"; }
    
    return "Grade 3";
  }

}