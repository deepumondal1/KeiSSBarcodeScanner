import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FToast{
  fcreatetoast(plainstr){
    return Fluttertoast.showToast(
      msg: plainstr,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}