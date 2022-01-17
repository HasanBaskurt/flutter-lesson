void main() {
  func("Hasan", 1998, true); //
  print("***********");
  optionalFunc(1998, true);
  print("***********");
  namedFunc(98, c: "Hasan");
}

void func(a, b, c) {
  // değişken türü belirsiz parametre alan fonksiyon
  print(a);
  print(b);
  print(c);
}

void optionalFunc(a, [b, c]) {
  // b ve c değerleri girilmek zorunda değil her ikiside girilebilir veya 1 tane girilirse ilk öndeki değere atama yapılır.
  print(a);
  print(b);
  print(c);
}

void namedFunc(a, {b, c}) {
  //b ve c değerleri
  print(a);
  print(b);
  print(c);
}
