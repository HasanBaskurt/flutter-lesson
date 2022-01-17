class ValidateMixin {
  String? firstNameValidate(value) {
    if (value.toString().isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  String? lastNameValidate(value) {
    if (value.toString().isEmpty) {
      return "Please enter your last name";
    }
    return null;
  }

  String? emailValidate(value) {
    if (value.toString().isEmpty) {
      return "Please enter your email";
    }
    return null;
  }

  String? passwordValidate(value) {
    if (value.toString().isEmpty) {
      return "Please enter your password";
    }
    return null;
  }
}
