import 'package:flutter/material.dart';
import '../../component/bottomNavBar.dart';
import '../../component/shopping_cart.dart';
import '../../constants.dart';
import '../../data_provider/my_course_data_provider.dart';
import '../../model/my_course.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({Key? key}): super(key : key);
  @override
  Widget build(BuildContext context) {
    List<MyCourse> myCourseList = MyCourseDataProvider.myCourses;

    // Adjusting progress for testing purposes
    if (myCourseList.length > 1) {
      myCourseList[1].progress = 50;
    }
    if (myCourseList.length > 2) {
      myCourseList[2].progress = 20;
    }

    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02), // Dynamic padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                child: Text(
                  "My Courses",
                  style: TextStyle(
                      fontSize: screenWidth * 0.06, // Dynamic font size
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05, // Dynamic height for the course type row
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCourseTypeContainer("All Courses", true, screenWidth*0.9),
                    _buildCourseTypeContainer("Downloaded Courses", false, screenWidth*0.9),
                    _buildCourseTypeContainer("Archived Courses", false, screenWidth*0.9),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // Dynamic space between elements
              // This will show the list of user selected course
              Expanded(
                child: ListView.builder(
                  itemCount: myCourseList.length,
                  itemBuilder: (context, index) {
                    MyCourse myCourse = myCourseList[index];
                    return getMyCourse(myCourse, context, screenWidth);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ShoppingCart(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }

  // This is the function to generate the my course list item and will be called from ListView
  Widget getMyCourse(MyCourse myCourse, BuildContext context, double screenWidth) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          myCourse.course.thumbnailUrl,
          width: screenWidth * 0.15, // Dynamic image size
          height: screenWidth * 0.15,
          fit: BoxFit.cover,
        ),
        title: Text(
          myCourse.course.title,
          maxLines: 2,
          style: TextStyle(
              fontSize: screenWidth * 0.04, // Dynamic font size
              color: Colors.grey.shade800
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              myCourse.course.createdBy,
              style: TextStyle(color: Colors.grey.shade500),
            ),
            SizedBox(height: screenWidth * 0.02), // Dynamic spacing
            Visibility(
              visible: myCourse.progress > 0,
              replacement: const Text(
                "Start Course",
                style: TextStyle(
                  color: kBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SliderTheme(
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
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text("${myCourse.progress}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build course type container dynamically
  Widget _buildCourseTypeContainer(String title, bool isSelected, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.grey.shade200,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey.shade900),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: screenWidth * 0.035, // Dynamic font size
            ),
          ),
        ),
      ),
    );
  }
}
