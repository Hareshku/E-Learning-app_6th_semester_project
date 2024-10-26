import 'package:flutter/material.dart';

import '../../component/bottomNavBar.dart';
import '../../component/shopping_cart.dart';
import '../../constants.dart';
import '../widgets/category_course_list.dart';
import '../widgets/featured_courses.dart';
import '../widgets/header.dart';
import '../widgets/offers.dart';
import '../widgets/search_course.dart';

class CourseHome extends StatelessWidget {
  const CourseHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Responsive container for the header section
              Container(
                height: screenHeight * 0.22, // Dynamic height based on screen
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, // Dynamic horizontal padding
                    vertical: screenHeight * 0.015, // Dynamic vertical padding
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.01), // Adjust height spacing
                      const Header(),
                      SizedBox(height: screenHeight * 0.01), // Adjust height spacing
                      const SearchCourse(),
                    ],
                  ),
                ),
              ),

              // Course offers and featured sections
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.025, // Dynamic horizontal padding
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Offers(),
                    SizedBox(height: screenHeight * 0.02), // Adjust vertical spacing
                    const FeaturedCourses(),
                    SizedBox(height: screenHeight * 0.02), // Adjust vertical spacing
                    const CategoryCourseList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const ShoppingCart(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
      ),
    );
  }
}
