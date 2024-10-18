import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../util/route_names.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/intro/intro.png"),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Grow Your skills",
            style: TextStyle(fontSize: 25, color: Colors.grey.shade900),
          ),
         const SizedBox(
            height: 30,
          ),
          Text(
            "Choose your favorite course & start learning",
            style: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          ),
         const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.CourseHome);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 50,vertical: 10),
              child:  Text(
                "Getting Started",
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
