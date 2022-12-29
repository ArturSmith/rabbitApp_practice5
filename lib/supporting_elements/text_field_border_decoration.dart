import 'package:flutter/material.dart';

class TextFieldBorderDecoration {
  TextFieldBorderDecoration(this.labelText, this.labelColor, this.borderColor);
  String labelText;
  Color labelColor;
  Color borderColor;
  InputDecoration setTextFieldBorderDecoration() {
    var borderDecoration = InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: labelColor),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
    );
    return borderDecoration;
  }
}
