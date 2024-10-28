import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/model/user_model.dart';
import 'package:readmore/readmore.dart';

import '../../arguments/checkout_argument.dart';
import '../../constants.dart';
import '../../data_provider/shopping_cart_data_provider.dart';
import '../../model/course.dart';
import '../../model/section.dart';
import '../../util/route_names.dart';
import '../../util/util.dart';
import 'favorite_option.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Calculate responsive values
    final double horizontalPadding = screenWidth * 0.05;
    final double verticalPadding = screenHeight * 0.015;
    final double iconSize = screenWidth * 0.06;
    final double largeIconSize = screenWidth * 0.15;
    final double titleFontSize = screenWidth * 0.05;
    final double subtitleFontSize = screenWidth * 0.04;
    final double regularFontSize = screenWidth * 0.035;
    final double smallFontSize = screenWidth * 0.03;
    final double bottomBarHeight = screenHeight * 0.08;

    final greyTextStyle = TextStyle(
      fontSize: regularFontSize,
      color: Colors.grey.shade600,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Navigation Bar
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: verticalPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.grey.shade800,
                                size: iconSize,
                              ),
                            ),
                          ),

                          Text("Course Details", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.grey.shade800,
                                  size: iconSize,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: InkWell(
                                  onTap: () => Util.openShoppingCart(context),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.grey.shade800,
                                    size: iconSize,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Course Thumbnail and Preview
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(screenWidth * 0.03),
                              ),
                              child: Image.asset(
                                course.thumbnailUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  size: largeIconSize,
                                  color: Colors.white,
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Text(
                                  "Preview this course",
                                  style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Course Details Container
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.08),
                          topRight: Radius.circular(screenWidth * 0.08),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: horizontalPadding,
                          right: horizontalPadding,
                          top: verticalPadding * 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.title,
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.015),

                            // Creator and Favorite
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: kBlueColor,
                                      size: iconSize,
                                    ),
                                    SizedBox(width: screenWidth * 0.02),
                                    Text(
                                      course.createdBy,
                                      style: TextStyle(
                                        fontSize: regularFontSize,
                                        color: kBlueColor,
                                      ),
                                    ),
                                  ],
                                ),
                                FavoriteOption(course: course),
                              ],
                            ),

                            // Course Stats
                            Wrap(
                              spacing: screenWidth * 0.05,
                              children: [
                                _buildStatItem(
                                  Icons.play_circle_outline,
                                  '${course.lessonNo} Lessons',
                                  greyTextStyle,
                                  iconSize,
                                ),
                                _buildStatItem(
                                  Icons.access_time,
                                  course.duration,
                                  greyTextStyle,
                                  iconSize,
                                ),
                                _buildStatItem(
                                  Icons.star,
                                  '${course.rate}',
                                  greyTextStyle,
                                  iconSize,
                                  iconColor: Colors.yellow,
                                ),
                              ],
                            ),

                            // Course Description
                            ReadMoreText(
                              course.description,
                              trimLines: 2,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "show More",
                              trimExpandedText: "show less",
                              moreStyle: TextStyle(
                                color: kBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: smallFontSize,
                              ),
                              lessStyle: TextStyle(
                                color: kBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: smallFontSize,
                              ),
                              style: TextStyle(
                                fontSize: regularFontSize,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.02),

                            // Course Content Header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Course Content",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: subtitleFontSize,
                                  ),
                                ),
                                Text(
                                  "(${course.sections.length} sections)",
                                  style: TextStyle(
                                    fontSize: regularFontSize,
                                    color: Colors.grey.shade700,
                                  ),
                                )
                              ],
                            ),

                            // Course Sections
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: course.sections.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => buildCourseContent(
                                index,
                                regularFontSize,
                                smallFontSize,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Bottom Bar
            Container(
              height: bottomBarHeight,
              margin: EdgeInsets.symmetric(
                horizontal: horizontalPadding * 0.25,
                vertical: verticalPadding,
              ),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${course.price}',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      Row(
                        children: [
                          _buildButton(
                            'Add to cart',
                                () async{
                              String message = "Course is already added into cart";
                              if (!ShoppingCartDataProvider.shoppingCartCourseList
                                  .contains(course)) {
                                final uid = FirebaseAuth.instance.currentUser?.uid;
                                final CollectionReference courseRef = FirebaseFirestore.instance.collection('user').doc(uid).collection('cart');
                                courseRef.add(
                                    {'thumbnail':course.thumbnailUrl,'title':course.title,'createdBy':course.createdBy,'rate':course.rate,'price':course.price,'duration':course.duration,'lesson':course.lessonNo});
                                ShoppingCartDataProvider.addCourse(course);
                                message = "Course is added into cart";
                              }
                              Util.showMessageWithAction(
                                context,
                                message,
                                "View",
                                    () => Util.openShoppingCart(context),
                              );
                            },
                            regularFontSize,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          _buildButton(
                            'Buy',
                                () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.checkoutScreen,
                                arguments:
                                CheckoutArgument([course], course.price),
                              );
                            },
                            regularFontSize,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
      IconData icon,
      String text,
      TextStyle textStyle,
      double iconSize, {
        Color? iconColor,
      }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        SizedBox(width: 10),
        Text(text, style: textStyle),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed, double fontSize) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }

  Widget buildCourseContent(int index, double titleSize, double subtitleSize) {
    Section section = course.sections[index];
    return ExpansionTile(
      title: Text(
        "Section ${index + 1} - ${section.name}",
        style: TextStyle(
          fontSize: titleSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: section.lectures.map((lecture) {
        return ListTile(
          leading: const SizedBox(),
          title: Text(
            lecture.name,
            style: TextStyle(fontSize: subtitleSize),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.access_time,
                size: subtitleSize,
              ),
              SizedBox(width: 10),
              Text(
                lecture.duration,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: subtitleSize,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}