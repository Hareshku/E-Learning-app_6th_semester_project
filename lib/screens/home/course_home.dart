import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/data_provider/my_course_data_provider.dart';
import 'package:online_course_app/model/course.dart';

import '../../component/bottomNavBar.dart';
import '../../component/shopping_cart.dart';
import '../../constants.dart';
import '../../model/my_course.dart';
import '../widgets/category_course_list.dart';
import '../widgets/featured_courses.dart';
import '../widgets/header.dart';
import '../widgets/offers.dart';
import '../widgets/search_course.dart';

class CourseHome extends StatelessWidget {
  const CourseHome({Key? key}) : super(key: key);

  // Future<void> fetchData() async{
    // fetch wishlist
    Future<List<Map<String, dynamic>>> fetchWishlistItems() async {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) {
        return [];  // Return an empty list if user is not logged in
      }
      final CollectionReference courseRef = FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .collection('wishList');

      final QuerySnapshot snapshot = await courseRef.get();
      final wishlistItems = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

      return wishlistItems;
    }

    // fetch cart list
    Future<List<Map<String, dynamic>>> fetchCartItems() async {


      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) {
        return [];  // Return an empty list if user is not logged in
      }

      final CollectionReference cartRef = FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .collection('cart');

      final QuerySnapshot snapshot = await cartRef.get();
      final cartItems = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      return cartItems;
    }


    // fetch myCourse list
  Future<List<Map<String, dynamic>>> fetchMyCourses() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      return [];  // Return an empty list if the user is not logged in
    }

    final CollectionReference myCourseRef = FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .collection('myCourse');

    final QuerySnapshot snapshot = await myCourseRef.get();
    final myCourses = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    return myCourses;
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Responsive container for the header section
              Container(
                height: screenHeight * 0.22, // Dynamic height based on screen
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, // Dynamic horizontal padding
                    vertical: screenHeight * 0.015, // Dynamic vertical padding
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.01), // Adjust height spacing
                      const Header(),
                      SizedBox(height: screenHeight * 0.01), // Adjust height spacing
                      const SearchCourse(),
                    ],
                  ),
                ),
              ),

              // Course offers and featured sections
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.025, // Dynamic horizontal padding
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Offers(),
                    SizedBox(height: screenHeight * 0.02), // Adjust vertical spacing
                    const FeaturedCourses(),
                    SizedBox(height: screenHeight * 0.02), // Adjust vertical spacing
                    const CategoryCourseList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const ShoppingCart(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
      ),
    );
  }
}
