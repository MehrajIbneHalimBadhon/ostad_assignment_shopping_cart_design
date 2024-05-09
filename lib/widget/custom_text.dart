import 'package:flutter/material.dart';

Widget customText(String text, double fontSize, Color color,FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, color: color,fontWeight: fontWeight),
  );
}