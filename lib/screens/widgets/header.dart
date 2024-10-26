import 'package:flutter/material.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Responsive text size based on screen width
            Text(
              "Welcome to E-learn",
              style: TextStyle(
                fontSize: screenWidth * 0.06, // Dynamic font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01, // Dynamic vertical spacing
            ),
            Text(
              "Let's learn something new today",
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Dynamic font size
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              height: screenHeight * 0.06, // Responsive size
              width: screenHeight * 0.06,  // Making it square
              decoration: BoxDecoration(
                color: kOptionColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(Icons.notifications, color: Colors.white, size: screenHeight * 0.03), // Icon size responsive
                    Container(
                      height: screenHeight * 0.015, // Responsive notification badge size
                      width: screenHeight * 0.015,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.03), // Dynamic horizontal spacing
            Container(
              height: screenHeight * 0.06, // Responsive size
              width: screenHeight * 0.06,  // Square size
              decoration: const BoxDecoration(
                color: kOptionColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(Icons.person, color: Colors.white, size: screenHeight * 0.03), // Responsive icon size
            ),
          ],
        ),
      ],
    );
  }
}
