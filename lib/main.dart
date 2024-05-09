import 'package:flutter/material.dart';
import 'package:ostad_assignment_shopping_cart_design/const/app_color.dart';
import 'package:ostad_assignment_shopping_cart_design/views/shopping_cart.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ostad Assignment Shopping Cart',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
        )
      ),
      home:  const ShoppingCart(),
    );
  }
}

