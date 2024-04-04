import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiHelper {
  static customTextField(TextEditingController controller, String text,
      bool toHide, IconData iconData) {
    return TextField(
      controller: controller,
      obscureText: toHide,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }

  static customAlertbox(String text) {
    return Fluttertoast.showToast(msg: text);
  }

}
