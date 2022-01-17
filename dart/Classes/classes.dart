void main() {
  Customer customer = Customer.withId(1, "Hasan", "BAŞKURT");
  print(customer.id);

  Map<String, dynamic> map = {"id": 2, "name": "Hilal", "lastName": "BAŞKURT"};

  Customer customer2 = Customer.fromMap(map);
  print("**********");
  print(customer2.lastName);
  print(customer2.toMap());
}

class Customer {
  Customer() {}
  Customer.named(String name, String lastName) {
    _name = name;
    _lastName = lastName;
  }

  Customer.withId(int id, String name, String lastName) {
    _id = id;
    _name = name;
    _lastName = lastName;
  }

  Customer.fromMap(Map<String, dynamic> map) {
    _id = map["id"];
    _name = map["name"];
    _lastName = map["lastName"];
  }

  Map<String, dynamic> toMap() => {
        "id": _id,
        "name": _name,
        "lastName": _lastName,
      };

  late int _id;
  late String _name;
  late String _lastName;

  int get id => _id;
  set id(int id) => _id;

  String get name => _name;
  set name(String name) => _name;

  String get lastName => _lastName;
  set lastName(String lastName) => _lastName;
}
