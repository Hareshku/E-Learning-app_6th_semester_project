import 'package:flutter/material.dart';
import '../../../data_provider/course_data_provider.dart';
import '../../../model/course.dart';
import 'course_item.dart';

class FeaturedCourses extends StatelessWidget {
  const FeaturedCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // List of featured courses
    List<Course> featuredCourseList = [
      CourseDataProvider.courseList[9],
      CourseDataProvider.courseList[0],
      CourseDataProvider.courseList[1],
      CourseDataProvider.courseList[2],
      CourseDataProvider.courseList[7],
      CourseDataProvider.courseList[5],
    ];

    return Column(
      children: [
        // Header for Featured Courses
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured Courses",
              style: TextStyle(
                // fontSize: screenWidth * 0.05,  // Responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "See All",
                style: TextStyle(
                  color: Colors.blue,
                  // fontSize: screenWidth * 0.04,  // Responsive font size
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.01,  // Dynamic spacing
        ),

        // List of featured courses in a horizontal ListView
        SizedBox(
          height: 200,  // Dynamic height based on screen size
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredCourseList.length,
            itemBuilder: (context, index) {
              Course course = featuredCourseList[index];
              // Widget to show course details
              return CourseItem(course: course);
            },
          ),
        ),
      ],
    );
  }
}
