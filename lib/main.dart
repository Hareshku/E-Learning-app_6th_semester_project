import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'arguments/checkout_argument.dart';
import 'arguments/course_argument.dart';
import 'firebase_options.dart';
import 'screens/Courses/my_course_list.dart';
import 'screens/Courses/wishlist_screen.dart';
import 'screens/details/course_details.dart';
import 'screens/home/course_home.dart';
import 'screens/intro/intro_screen.dart';
import 'screens/register/account_screen.dart';
import 'screens/register/login.dart';
import 'screens/register/sign_up.dart';
import 'shopping/checkout_screen.dart';
import 'shopping/shopping_cart_screen.dart';
import 'util/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        RouteNames.courseHome: (context) => const CourseHome(),
        RouteNames.shoppingCartScreen: (context) => const ShoppingCartScreen(),
        RouteNames.myCourseList:(context)=>const MyCourseList(),
        RouteNames.wishlistScreen: (context) => const WishlistScreen(),
        RouteNames.account : (context) => const Account(),
        RouteNames.signUpPage : (context) => const SignUpPage(),
        RouteNames.loginPage : (context) => const LoginPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == RouteNames.courseDetails) {
          // course argument created to pass course details to detail screen
          final args = settings.arguments as CourseArgument;
          return MaterialPageRoute(
              builder: (context) => CourseDetails(course: args.course));
        }
        else if (settings.name == RouteNames.checkoutScreen) {
          // checkout argument to pass data to checkout screen
          final args = settings.arguments as CheckoutArgument;
          return MaterialPageRoute(
              builder: (context) => CheckoutScreen(
                  courseList: args.courseList,
                  totalPrice: args.totalPrice));
        }
      },
    );
  }
}
