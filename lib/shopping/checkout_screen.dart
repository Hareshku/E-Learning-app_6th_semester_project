import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/data_provider/shopping_cart_data_provider.dart';
import 'package:online_course_app_ui/util/route_names.dart';
import 'package:online_course_app_ui/util/util.dart';

import '../data_provider/my_course_data_provider.dart';
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
                ElevatedButton(onPressed: (){
                  // here we will clear items from shopping cart list and
                  //add in users my course list to place the order
                  //for this video Iam not going to cover transaction
                  //so lets add data provider for users courses
                  // first of all lets define model class for users courses
                  //which will keep course details as well as course progress
                  MyCourseDataProvider.addAllCourse(courseList);
                  // lets clear shopping cart
                  ShoppingCartDataProvider.clearCart();
                  // this would be different with actual backend integrated app
                  //here we do not have backend so Iam doing this way
                  // now lets show order placed message
                  Util.showMessage(context, "Your order is placed successfully");
                  // navigate to home page
                  Navigator.pushNamed(context, RouteNames.CourseHome);




                },
                  style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                    child: const Text(
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
