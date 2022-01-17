import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider_counter_sayac/widgets/counter.dart';

class CounterSceeen extends StatelessWidget {
  const CounterSceeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
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
          heroTag: 1,
          onPressed: MyCounter.increaseCounter,
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          heroTag: 2,
          onPressed: MyCounter.decreaseCounter,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }

  Widget builderBody(context) {
    // ignore: non_constant_identifier_names
    int MyCounter = Provider.of<CounterModel>(context).getCounter;
    // ignore: avoid_print
    print(MyCounter.toString());

    return Column(
      children: [
        Center(
          child: Text(MyCounter.toString()),
        ),
      ],
    );
  }
}
