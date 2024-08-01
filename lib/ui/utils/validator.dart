

String? requiredFieldValidator({required String? input, required String errorMgs}) {
  if (input == null ||  input.trim().isEmpty ) {
    return errorMgs;
  } else {
    return null;
  }
}

String? passValidator(String? input) {
  if (input == null || input.trim().length < 6) {
    return 'Password must be 6 characters long';
  } else {
    return null;
  }
}

String? emailValidator(String? input) {
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  if (input == null || !emailRegex.hasMatch(input)) {
    return 'Enter valid email Address';
  } else {
    return null;
  }
}