import 'package:flutter/material.dart';

void showErroMessage(
  BuildContext context,{
 required String message,
  }){
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

  
  void showSucessMessage(
    BuildContext context,{
    required String message,
  }){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
