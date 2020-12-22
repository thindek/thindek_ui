import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/index.dart';

Future<bool> thdkToastInfo({
  @required String msg,
  Color backgroundColor = Colors.black54,
  Color textColor = Colors.white,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: backgroundColor,
    timeInSecForIosWeb: 1,
    textColor: textColor,
    fontSize: autoFontSize(30),
  );
}
