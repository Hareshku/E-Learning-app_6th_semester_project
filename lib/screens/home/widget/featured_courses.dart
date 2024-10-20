import 'package:flutter/material.dart';
import '../../../data_provider/course_data_provider.dart';
import '../../../model/course.dart';
import 'course_item.dart';

class FeaturedCourses extends StatelessWidget {
  const FeaturedCourses({Key? key}) : super(key: key);

// featured courses related data is in data_provider
// get data for featured courses form data_provider
  @override
  Widget build(BuildContext context) {
    // access list of featured courses

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured Courses",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "See All",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        // this will show the featured courses in horizental listView
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredCourseList.length,
            itemBuilder: (context, index) {
              Course course = featuredCourseList[index];
              // create a separate widget to show course details. we will be using same widget for other featured courses too.
              return CourseItem(course: course);
              // catgory list
            },
          ),
        ),
      ],
    );
  }
}
