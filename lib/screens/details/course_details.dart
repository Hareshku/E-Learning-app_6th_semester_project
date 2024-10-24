import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:readmore/readmore.dart';

import '../../arguments/checkout_argument.dart';
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
    var greyTextStyle = TextStyle(fontSize: 15, color: Colors.grey.shade600);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.arrow_back,
                                      color: Colors.grey.shade800),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){
                                        Util.openShoppingCart(context);
                                      },
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(alignment: Alignment.center, children: [
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(course.thumbnailUrl)),
                          const Column(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                size: 90,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Preview this course",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          )
                        ]),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     children: [Icon(Icons.share, color: Colors.grey.shade800),
                        //
                        //       Icon(Icons.shopping_cart, color: Colors.grey.shade800),
                        //
                        //
                        //
                        //     ],
                        //   ),
                        // ),
                        // ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course.title,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800),
                                  ),
                                 const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                         const Icon(
                                            Icons.person,
                                            color: kBlueColor,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            course.createdBy,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: kBlueColor),
                                          ),
                                        ],
                                      ),
                                      FavoriteOption(course: course),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.play_circle_outline),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${course.lessonNo} Lessons',
                                            style: greyTextStyle,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.access_time),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            course.duration,
                                            style: greyTextStyle,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 25,
                                            color: Colors.yellow,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${course.rate}',
                                            style: greyTextStyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  ReadMoreText(
                                    course.description,
                                    trimLines: 2,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: "show More",
                                    trimExpandedText: "show less",
                                    moreStyle: const TextStyle(
                                        color: kBlueColor,
                                        fontWeight: FontWeight.bold),
                                    lessStyle: const TextStyle(
                                        color: kBlueColor,
                                        fontWeight: FontWeight.bold),
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Course Content",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "(${course.sections.length} sections)",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade700),
                                      )
                                    ],
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: course.sections.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return buildCourseContent(index);
                                      })
                                ]),
                          ))
                    ]),
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${course.price}',
                        style: TextStyle(
                            fontSize: 30, color: Colors.grey.shade900),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              String message =
                                  "Course is already added into cart";
                              if (!ShoppingCartDataProvider
                                  .shoppingCartCourseList
                                  .contains(course)) {
                                message = "Course is added into cart";
                                ShoppingCartDataProvider.addCourse(course);
                              }
                              // lets us show message in snack bar, so lets create snack bar utility method first

                              Util.showMessageWithAction(
                                  context, message, "View", () {
                                    // this create shopping cart list
                               Util.openShoppingCart(context);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor),
                            child: const Text(
                              "add to cart",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(

                            // when Clicked on buy button it will navigate to checkout screen to buy single course
                            onPressed: () {
                              Navigator.pushNamed(context, RouteNames.CheckoutScreen,
                              arguments: CheckoutArgument([course], course.price),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor),
                            child: const Text(
                              "Buy",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          )
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

  // this method will help us to build course content
  Widget buildCourseContent(int index) {
    Section section = course.sections[index];
    return ExpansionTile(
      title: Text(
        "Section ${index + 1} - ${section.name}",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      children: section.lectures.map((lecture) {
        return ListTile(
          leading: const SizedBox(),
          title: Text(lecture.name),
          subtitle: Row(
            children: [
              Icon(
                Icons.access_time,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                lecture.duration,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
