import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widget/category_course_list.dart';
import 'widget/category_list.dart';
import 'widget/course_list.dart';
import 'widget/featured_courses.dart';
import 'widget/header.dart';
import 'widget/offers.dart';
import 'widget/search_course.dart';

class CourseHome extends StatelessWidget {
  const CourseHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 170,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),

                child:const  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Header(),
                      SizedBox(height: 10,),
                      SearchCourse(),
                    ],
                  ),
                ),
              ),

              // course offers
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Offers(),
                    // featured courses
                    const FeaturedCourses(),
                    const CategoryCourseList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
