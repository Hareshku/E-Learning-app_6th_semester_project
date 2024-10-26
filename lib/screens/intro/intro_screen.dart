import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../util/route_names.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Calculate responsive values
    final double imageHeight = screenHeight * 0.4; // 40% of screen height
    final double titleFontSize = screenWidth * 0.06; // 6% of screen width
    final double subtitleFontSize = screenWidth * 0.04; // 4% of screen width
    final double buttonFontSize = screenWidth * 0.045; // 4.5% of screen width

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05, // 5% padding on each side
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: imageHeight,
                            ),
                            child: Image.asset(
                              "images/intro/intro.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03, // 3% of screen height
                        ),
                        FittedBox(
                          child: Text(
                            "Grow Your skills",
                            style: TextStyle(
                              fontSize: titleFontSize,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        FittedBox(
                          child: Text(
                            "Choose your favorite course & start learning",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Container(
                          width: screenWidth * 0.7, // 70% of screen width
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RouteNames.signUpPage);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.05, // 5% of screen width
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05,
                                vertical: screenHeight * 0.015,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "Getting Started",
                                  style: TextStyle(
                                    fontSize: buttonFontSize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}