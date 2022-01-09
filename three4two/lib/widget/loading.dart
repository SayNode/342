import 'package:flutter/material.dart';
Loading(BuildContext context) {
return showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  });
 }