import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.selectedIndex}):super(key: key);

  final int selectedIndex ;
  // Lets show shopping cart option in the center of bottom navigation bar using notch

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              // on click this will open the respective screen
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home, color:getSelectedColor(1) ,),
                    SizedBox(height: 5,),
                    Text("Home", style: TextStyle(fontSize: 13, color: getSelectedColor(1)),),
                  ],
                ),
              ),
            ),
            InkWell(
            // on click this will open the respective screen
            onTap: (){

            },
            child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Icon(Icons.play_circle_outline, color:getSelectedColor(2) ,),
            SizedBox(height: 5,),
            Text("My Courses", style: TextStyle(fontSize: 13, color: getSelectedColor(2)),),
            ],
            ),
            ),
            ),
            InkWell(
              // on click this will open the respective screen
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite_border, color:getSelectedColor(3) ,),
                    SizedBox(height: 5,),
                    Text("Wishlist", style: TextStyle(fontSize: 13, color: getSelectedColor(3)),),
                  ],
                ),
              ),
            ),
            InkWell(
              // on click this will open the respective screen
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.people, color:getSelectedColor(4) ,),
                    SizedBox(height: 5,),
                    Text("Account", style: TextStyle(fontSize: 13, color: getSelectedColor(4)),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Color getSelectedColor(int currentIndex){
    return (selectedIndex== currentIndex)?kPrimaryColor:Colors.grey.shade800;
  }
}
