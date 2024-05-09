import 'package:flutter/material.dart';
import 'package:ostad_assignment_shopping_cart_design/const/app_color.dart';

Widget customButton(String buttonName,VoidCallback onPressed) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0), // Adjust the value as needed
        ),
      ),
    ),
    onPressed: onPressed,
    child: Text(buttonName),
  );
}