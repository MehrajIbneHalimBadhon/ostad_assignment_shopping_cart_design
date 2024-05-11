import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customIconButton(Icon icon,VoidCallback onTap){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: icon,
        ),
      ),
    ),
  );
}