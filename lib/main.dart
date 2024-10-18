import 'package:flutter/material.dart';

import 'screens/home/course_home.dart';
import 'screens/intro/intro_screen.dart';
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
      },
    );
  }
}
