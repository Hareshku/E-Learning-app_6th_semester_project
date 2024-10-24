import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/data_provider/my_course_data_provider.dart';
import 'package:online_course_app_ui/model/my_course.dart';
import 'package:online_course_app_ui/shopping/shopping_cart_screen.dart';

import '../../component/bottomNavBar.dart';
import '../../component/shopping_cart.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({Key? key}): super(key : key);

  @override
  Widget build(BuildContext context) {
    List<MyCourse> myCourseList = MyCourseDataProvider.myCourses;
    if (myCourseList.length > 1) {
      myCourseList[1].progress = 50;
    }

    if (myCourseList.length > 2) {
      myCourseList[2].progress = 20;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("My Courses",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
                ),
                ),
              SizedBox(
                      height: 30,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:[
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            alignment : Alignment.center,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.grey.shade900)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("All Courses",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            alignment : Alignment.center,
                            decoration: BoxDecoration(
                                color:Colors.grey.shade200,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.grey.shade900)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Download Courses",style: TextStyle(color: Colors.black),),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            alignment : Alignment.center,
                            decoration: BoxDecoration(
                                color:Colors.grey.shade200,                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.grey.shade900)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Archived Courses",style: TextStyle(color: Colors.black),),
                            ),
                          ),
                        ),
                          ]
                      ),
                    ),
              const SizedBox(height: 10,),
              // this will show the list of user selected course
              Expanded(child: ListView.builder(
                  itemCount: myCourseList.length,
                  itemBuilder: (context, index){
                   MyCourse myCourse = myCourseList[index];
                   return getMyCourse(myCourse, context);
              }))

            ],
                ),
              ),
          ),
        floatingActionButton:ShoppingCart(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(selectedIndex: 2,),
      );
  }

  // this is the function to generate the my course list item and will be called from ListView
Widget getMyCourse (MyCourse myCourse, BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(myCourse.course.thumbnailUrl),
        title: Text(myCourse.course.title,maxLines: 2,style: TextStyle(fontSize: 17,color: Colors.grey.shade800),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(myCourse.course.createdBy,
              style: TextStyle(color: Colors.grey.shade500),

            ),

            const SizedBox(height: 10,
            ),
            Visibility(
                visible: myCourse.progress >0,
                replacement: const Text(
                    "Start Course",
                  style: TextStyle(color: kBlueColor,fontWeight: FontWeight.bold),

                ),
                child: Row(
                children: [
                  Expanded(child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 3,
                      thumbColor: Colors.transparent,
                      overlayShape: SliderComponentShape.noThumb,
                      thumbShape: SliderComponentShape.noThumb,

                    ),
                    child: Slider(
                      min: 0,
                      max: 100,
                      value: myCourse.progress.toDouble(),
                      onChanged: (val){},
                    
                    
                    ),
                  )),
                  const SizedBox(
                   width: 10, 
                  ),
                  Text("${myCourse.progress}")
                ],
            ))

            // if course is already started by user , show course progress
            // here we won't be showing video for course to watch so just create a
            // sample data from existing my courses list
          ],
        ),
      ),
      
    );
}
}
