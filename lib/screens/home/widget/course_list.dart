import 'package:flutter/cupertino.dart';
import 'package:online_course_app_ui/data_provider/course_data_provider.dart';
import 'package:online_course_app_ui/model/course_category.dart';
import 'package:online_course_app_ui/notifier/course_Category_Change_Notifier.dart';
import 'package:provider/provider.dart';

import '../../../model/course.dart';
import 'course_item.dart';

class CourseList extends StatelessWidget {
  const CourseList({Key? key}): super(key : key);
    // this will show all the curses, and will change the course list based on selected category
  // for that use provider pattern,
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,

    shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: getCourseList(context).map((course){
      return CourseItem(course:course);
      },).toList(),
    );
  }
  List<Course> getCourseList(BuildContext context){
    var category = Provider.of<CourseCategoryChangeNotifier>(context).category;
    if(category== CourseCategory.all){
      return CourseDataProvider.courseList;
    }
    return CourseDataProvider.courseList.where((course)=>course.courseCategory==category).toList();
  }
}
