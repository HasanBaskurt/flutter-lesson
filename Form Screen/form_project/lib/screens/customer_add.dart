import 'package:flutter/material.dart';
import 'package:form_project/models/customer.dart';
import 'package:form_project/widgets/form_widgets/form_widgets.dart';

class CustomerAdd extends StatefulWidget {
  const CustomerAdd({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

class CustomerAddState extends State<CustomerAdd> {
  FormWidgets formWidget = FormWidgets();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Form App"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 500,
                margin: const EdgeInsets.all(25),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        formWidget.firstNameField(),
                        formWidget.lastNameField(),
                        formWidget.emailField(),
                        formWidget.passwordField(),
                        saveButton(),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget saveButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
        color: Colors.black,
        textColor: Colors.white,
        child: const Text("Save"),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            saveCustomer(formWidget.customer);
          }
        });
  }

  void saveCustomer(Customer customer) {
    // ignore: avoid_print
    print(customer.firstName.toString() + " " + customer.lastName.toString());
  }
}
