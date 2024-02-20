import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiHelper{

  static customTextField(TextEditingController controller, IconData iconData, String text, bool toHide, ){
    return  TextField(
      controller: controller,
      obscureText: toHide,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue,),
        ),
      ),
    );
  }
  static customAlertBox(String msg){
    return Fluttertoast.showToast(msg: msg,fontSize: 15);
  }
}