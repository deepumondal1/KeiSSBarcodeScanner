import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FToast{
  static fcreatetoast({@required String msg, Color backgroundColor}){
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}