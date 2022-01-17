class Product {
  int? _id;
  String? _name;
  String? _description;
  int? _price;

  Product(this._name, this._description, this._price);
  Product.withId(this._id, this._name, this._description, this._price);

  int? get getId => _id;
  set setId(int id) => _id;

  String? get getName => _name;
  set setName(String name) => _name;

  String? get getDescription => _description;
  set setDescription(String description) => _description;

  int? get getPrice => _price;
  set setPrice(double price) => _price;

  Product.fromObject(dynamic o) {
    _id = o["Id"];
    _name = o["Name"];
    _description = o["Description"];
    _price = o["Price"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["Id"] = _id;
    }
    map["Name"] = _name;
    map["Description"] = _description;
    map["Price"] = _price;

    return map;
  }
}
