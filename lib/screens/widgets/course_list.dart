import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../model/course.dart';
import '../../data_provider/course_data_provider.dart';
import '../../model/course_category.dart';
import '../../notifier/course_Category_Change_Notifier.dart';
import 'course_item.dart';

class CourseList extends StatelessWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine grid layout
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the number of grid columns based on screen width
    int crossAxisCount = getCrossAxisCount(screenWidth);

    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,  // Dynamic column count
        crossAxisSpacing: 10,            // Space between columns
        mainAxisSpacing: 10,             // Space between rows
        childAspectRatio: getAspectRatio(screenWidth),  // Dynamic aspect ratio for items
      ),
      itemCount: getCourseList(context).length,
      itemBuilder: (context, index) {
        return CourseItem(course: getCourseList(context)[index]);
      },
    );
  }

  // Method to get the course list based on the selected category
  List<Course> getCourseList(BuildContext context) {
    var category = Provider.of<CourseCategoryChangeNotifier>(context).category;
    if (category == CourseCategory.all) {
      return CourseDataProvider.courseList;
    }
    return CourseDataProvider.courseList
        .where((course) => course.courseCategory == category)
        .toList();
  }

  // Method to determine the number of columns based on screen width
  int getCrossAxisCount(double screenWidth) {
    if (screenWidth >= 1200) {
      return 4;  // For large screens like tablets or desktops
    } else if (screenWidth >= 800) {
      return 3;  // For medium-sized screens
    } else {
      return 2;  // For smaller devices like phones
    }
  }

  // Method to adjust aspect ratio for the grid items
  double getAspectRatio(double screenWidth) {
    if (screenWidth >= 1200) {
      return 1.2;  // Aspect ratio for larger screens (wider cards)
    } else if (screenWidth >= 800) {
      return 1.1;  // Aspect ratio for medium screens
    } else {
      return 0.9;  // Aspect ratio for smaller devices
    }
  }
}
