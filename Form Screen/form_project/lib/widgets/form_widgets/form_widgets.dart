import 'package:flutter/material.dart';
import 'package:form_project/mixins/validate_mixin.dart';
import 'package:form_project/models/customer.dart';

class FormWidgets with ValidateMixin {
  final customer = Customer();
  Widget firstNameField() {
    return TextFormField(
      validator: firstNameValidate,
      onSaved: (value) {
        customer.firstName = value.toString();
      },
      decoration: const InputDecoration(labelText: "Name"),
    );
  }

  Widget lastNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Last Name"),
      validator: lastNameValidate,
      onSaved: (value) {
        customer.lastName = value.toString();
      },
    );
  }

  Widget emailField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: emailValidate,
        onSaved: (value) {
          customer.Email = value.toString();
        },
        decoration: const InputDecoration(
          labelText: "Email",
        ));
  }

  Widget passwordField() {
    return TextFormField(
      validator: passwordValidate,
      onSaved: (value) {
        customer.Password = value.toString();
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
      ),
    );
  }
}
