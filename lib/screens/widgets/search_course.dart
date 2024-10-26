import 'package:flutter/material.dart';

class SearchCourse extends StatelessWidget {
  const SearchCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Search for courses",
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 15,
          // fontSize: screenWidth * 0.04, // Adjust hint text size based on screen width
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03), // Dynamic padding for prefix icon
          child: Icon(
            Icons.search,
            size: screenHeight * 0.03, // Adjust icon size based on screen height
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.015, // Dynamic padding for content
          horizontal: screenWidth * 0.03, // Dynamic padding for content
        ),
        fillColor: Colors.white,
      ),
    );
  }
}
