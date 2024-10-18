import 'package:online_course_app_ui/model/lecture.dart';

class Section {
  final String _name;

  final List<Lecture> _lectures;

  Section(this._name, this._lectures);

  List<Lecture> get lectures => _lectures;

  String get name => _name;
}
