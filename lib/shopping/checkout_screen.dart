import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';

import '../model/course.dart';
import 'widget/payment_method.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen(
      {Key? key, required this.courseList, required this.totalPrice})
      : super(key: key);

  final List<Course> courseList;
  final double totalPrice;
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
        child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Billing Address',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
              ),

              const SizedBox(
                height: 10,
              ),

              // this will show the country, city and state using CSCpicker package

              CSCPicker(
                layout: Layout.vertical,
                flagState: CountryFlag.DISABLE,
                onCountryChanged: (value) {},
                onStateChanged: (value) {},
                onCityChanged: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Widget for payment Method
              const PaymentMethod(),
              const SizedBox(
                height: 10,
              ),

              // course list for confirmed ordered
              Text(
                "Order",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: courseList.length,
                      itemBuilder: (context, index) {
                        Course course = courseList[index];
                        return ListTile(
                          leading: Image.asset(
                            course.thumbnailUrl,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(
                            course.title,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text("\$${course.price}"),
                        );
                      }))
            ],
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$$totalPrice",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900),
                ),
                ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                    child: Text(
                        "Place Order",
                      style: TextStyle(fontSize: 20),
                    ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
