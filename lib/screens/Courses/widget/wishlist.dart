import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/data_provider/course_data_provider.dart';
import 'package:online_course_app_ui/model/course.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    List<Course> courseList = getCourseList(context);
    return ListView.builder(
      shrinkWrap: true,
        itemCount: courseList.length,
        itemBuilder: (context, index) {
        Course course = courseList[index];
        // this function will create and show list item here
          return getListItem(course);

    });
  }

  // this will filter the list based on isFavorite flag
  List<Course> getCourseList(BuildContext context) {
    return CourseDataProvider.courseList
        .where((course) => course.isFavorite)
        .toList();
  }
  
  Widget getListItem(Course course){
    return Card(
      child: ListTile(
        leading: Image.asset(course.thumbnailUrl),
        title: Text(
          course.title,
          maxLines: 2,
          style: TextStyle(fontSize: 17, color:  Colors.grey.shade800),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "By ${course.createdBy}",
              style: const TextStyle( color: kPrimaryColor, fontSize:13, ),
            ),

            Row(
              children: [
                Text(
                  course.duration,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                ),
                const SizedBox(width: 10,),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),
                const SizedBox(width: 10,),
                Text(
                  "${course.lessonNo} Lessons",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                ),
                const SizedBox(width: 10,),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("${course.rate}"),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "\$${course.price}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                    fontWeight:FontWeight.bold,
                ),
                ),
                const SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    setState(() {
                      course.isFavorite =false;
                    });
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
