import 'package:online_course_app_ui/model/course.dart';

class CheckoutArgument {
  final List<Course> _courseList;
  final double _totalPrice =3000;

  CheckoutArgument(this._courseList);
  // CheckoutArgument(this._courseList,this._totalPrice);
  double get totalPrice => _totalPrice;
  List<Course> get courseList => _courseList;
}