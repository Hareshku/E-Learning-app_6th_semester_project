import 'package:online_course_app/screens/details/course_details.dart';

class MyUser{
  String? contact;
  String? email;
  String? name;
  String? password;
  CourseDetails? course;

  MyUser({required this.contact, required this.email, required this.name, required this.password, required this.course});
}