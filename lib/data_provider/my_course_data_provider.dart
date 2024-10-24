import 'package:online_course_app_ui/model/course.dart';
import 'package:online_course_app_ui/model/my_course.dart';

class MyCourseDataProvider{
  static final List<MyCourse> _myCourses=[];

  static void addCourse(Course course){
    _myCourses.add(MyCourse(course));
  }

  static void addAllCourse(List<Course>courses){
     for(var course in courses){
       _myCourses.add(MyCourse(course));

     }
  }

  static List<MyCourse> get myCourses => _myCourses;
}