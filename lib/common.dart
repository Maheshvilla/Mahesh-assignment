import 'package:flutter/material.dart';

class Common{
  Color bagrouncolor=Color.fromARGB(255, 244, 30, 15);

  
  String? validateMobile(String? value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,10}$)';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return "Enter Valid Mobile Number";
  } else if (!regExp.hasMatch(value)) {
    return "Enter Valid Mobile Number";
  }
  return null;
}

String? validateEmail(String? value) {
  String strPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(strPattern);
  if (value!.isEmpty) {
    return "Enter Valid Email";
  } else if (!regExp.hasMatch(value)) {
    return "Enter Valid Email";
  }
  return null;
}

String? validateName(String? value) {
  // String strPattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
  // RegExp regExp =  RegExp(strPattern);
  if (value!.length <= 2) {
    return "Enter Valid Name";
  }
  // else if (!regExp.hasMatch(value)) {
  // return "Enter Valid Email";
  // }
  return null;
}
}