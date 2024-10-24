import 'package:online_course_app_ui/model/course.dart';
import 'package:online_course_app_ui/model/my_course.dart';

class MyCourseDataProvider{
  static final List<MyCourse> _myCoursees=[];

  static void addCourse(Course course){
    _myCoursees.add(MyCourse(course));
  }

  static void addAllCourse(List<Course>courses){
     for(var course in courses){
       _myCoursees.add(MyCourse(course));

     }
  }

  static List<MyCourse> get myCoursees => _myCoursees;
}