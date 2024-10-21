import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';

import '../model/course.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key, required this.courseList, required this.totalPrice}):super(key : key);

  final List<Course> courseList;
  final double totalPrice ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Billing Address', style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold, color: Colors.grey.shade800),),

            const SizedBox(
              height:10 ,
            )
          ],
        ),
      ),
    );
  }
}
