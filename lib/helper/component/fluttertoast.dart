import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FToast {
  static fcreatetoast({@required String msg, Color backgroundColor}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor ?? Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static dialogBox(BuildContext context,{Widget title, String result, Color color}) {
    return showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: title ?? Text("Result"),
          content: Text(result, style: TextStyle(color: color)),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed:(){
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }
}
