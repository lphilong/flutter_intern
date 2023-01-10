import "package:flutter/material.dart";
import 'package:flutter/services.dart';

TextFormField form(String text, TextEditingController controller,
    String? Function(String?)? validator, bool isNumber) {
  return TextFormField(
    validator: validator,
    inputFormatters: isNumber
        ? [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))]
        : null,
    controller: controller,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.2),
    ),
  );
}
