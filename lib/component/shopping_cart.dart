import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: (){},
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
