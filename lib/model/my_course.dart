import 'package:online_course_app_ui/model/course.dart';

class MyCourse{
  final Course _course;
  int _progress=0;

  MyCourse(this._course);

  int get progress => _progress;

  Course get course => _course;

  set progress(int value) {
    _progress = value;
  }
}