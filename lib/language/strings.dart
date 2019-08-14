void main() {
  // concatenação
  String name = "Jhon doe";
  String text = "hello" + "world" + name;
  String format = "hello, ${name}";
  print(text);
  print(format);
}