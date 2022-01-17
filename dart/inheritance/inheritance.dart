void main() {
  Customer customer = Customer();
  Customer.staticFunction();
  customer.save();

  Personel person = Personel();
  person.save();
}

class Person<T> {
  //Generic class
  void save() {
    print(T.toString() + "Saved !");
  }
}

class Customer extends Person<Customer> {
  void BestCustomer() {
    print("Best Customer :)");
  }

  static staticFunction() {
    // example for static
    print("static function");
  }
}

class Personel extends Person<Personel> {
  void Pay() {
    print("Salary payed");
  }

  @override //Override
  void save() {
    print("Personel saved to sql !");
    super.save(); // called save function from main class with super key
  }
}
