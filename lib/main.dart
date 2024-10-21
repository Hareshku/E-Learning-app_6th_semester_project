import 'package:flutter/material.dart';
import 'package:online_course_app_ui/arguments/checkout_argument.dart';
import 'package:online_course_app_ui/component/shopping_cart.dart';

import 'screens/home/course_home.dart';
import 'screens/intro/intro_screen.dart';
import 'shopping/checkout_screen.dart';
import 'util/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        RouteNames.intro: (context) => const IntroScreen(),
        RouteNames.CourseHome: (context) => const CourseHome(),
        RouteNames.Shoping_cart: (context) => const ShoppingCart(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == RouteNames.CourseDetails) {
          // course argument created to pass course details to detail screen
          // final args = settings.arguments as CourseArgument;
          // return MaterialPageRoute(
          //     builder: (context) => CourseDetails(course: args.course));
        }
        else if (settings.name == RouteNames.CheckoutScreen) {
          // Lets create checkout argument to pass data to checkout screen
          final args = settings.arguments as CheckoutArgument;
          return MaterialPageRoute(
              builder: (context) => CheckoutScreen(courseList: args.courseList, totalPrice: args.totalPrice));
        }
      },
    );
  }
}
