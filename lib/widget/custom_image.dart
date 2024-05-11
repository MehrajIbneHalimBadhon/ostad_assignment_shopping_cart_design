import 'package:flutter/material.dart';

Widget customImage(String image) {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        image,
        width: double.maxFinite,
        fit: BoxFit.cover, // Adjust how the image fits within the container
      ),
    ),
  );
}