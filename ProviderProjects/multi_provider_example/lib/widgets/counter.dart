import 'package:flutter/cupertino.dart';

class CounterModel extends ChangeNotifier {
  int _counter;
  CounterModel(this._counter);

  int get getCounter => _counter;

  void increaseCounter() {
    _counter++;
    notifyListeners();
  }

  void decreaseCounter() {
    _counter--;
    notifyListeners();
  }
}
