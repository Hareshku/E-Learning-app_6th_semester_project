import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/model/course_category.dart';
import 'package:online_course_app_ui/notifier/course_Category_Change_Notifier.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var category =Provider.of<CourseCategoryChangeNotifier>(context).category;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        // this will show the category list horizentaly
        SizedBox(
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CourseCategory.values.length,
              itemBuilder: (context, index) {
                CourseCategory courseCategory = CourseCategory.values[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      Provider.of<CourseCategoryChangeNotifier>(context, listen: false).changeCategory(courseCategory);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:category== courseCategory?kPrimaryColor: Colors.white,
                        border: Border.all(color: Colors.grey.shade800),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          courseCategory.title,
                          style:
                           TextStyle(fontSize: 15, color: category== courseCategory?Colors.white:Colors.black,),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        // this will show all course list
        // this will change course list as per category once we show the course list
      ],
    );
  }
}
