void main() {
  loopFor();
  loopWhile();
}

void loopFor() {
  // variavel; condicao; acrescimo
  print('for');
  for (int start = 1; start <= 3; start++) {
    print(start);
  }
}

void loopWhile() {
  print('while');
  int start = 3;
  // recebe uma condicao
  while (start < 6) {
    print(start);
    start++;
  }
}

void loopForInVar() {
  
}

void loopDoWhile() {
  
}