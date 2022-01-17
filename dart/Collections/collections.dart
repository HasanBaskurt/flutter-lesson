void main() {
  Engineer engineer = Engineer(1, "Hasan", "BAŞKURT");
  List<Engineer> engineerList = <Engineer>[];
  engineerList.add(engineer);

  print(engineerList[0]._name);
}

class Engineer {
  Engineer(int id, String name, String surname) {
    _id = id;
    _name = name;
    _surname = surname;
  }
  late int _id;
  late String _name;
  late String _surname;

  int get id => _id;
  set id(int id) => _id;

  String get name => _name;
  set name(String name) => _name;

  String get surname => _surname;
  set surname(String surname) => _surname;

  Engineer.fromMap(Map map) {
    _id = map[id];
    _name = map["name"];
    _surname = map["surname"];
  }

  Map toMap() => {"id": _id, "name": _name, "surname": _surname};
}
