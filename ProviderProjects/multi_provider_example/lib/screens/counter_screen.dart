import 'package:multi_provider_example/widgets/counter.dart';
import 'package:multi_provider_example/widgets/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CounterSceeen extends StatelessWidget {
  const CounterSceeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userName = Provider.of<UserModel>(context).name;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        // ignore: unnecessary_string_interpolations
        title: Text("$userName"),
        centerTitle: true,
      ),
      body: builderBody(context),
      floatingActionButton: MyFloatingActionButton(context),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyFloatingActionButton(context) {
    // ignore: non_constant_identifier_names
    var MyCounter = Provider.of<CounterModel>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          heroTag: 1,
          onPressed: MyCounter.increaseCounter,
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          backgroundColor: Colors.redAccent,
          heroTag: 2,
          onPressed: MyCounter.decreaseCounter,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }

  Widget builderBody(context) {
    return Center(
      //Consumer kullanımı
      child: Consumer<CounterModel>(
        builder: (_, counter, __) => Text(
          counter.getCounter.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
