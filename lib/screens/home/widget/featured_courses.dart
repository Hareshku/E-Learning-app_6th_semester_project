import 'package:flutter/material.dart';

class FeaturedCourses extends StatelessWidget {
  const FeaturedCourses({Key? key}): super(key : key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Featured Courses",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            InkWell(
              onTap: (){},
              child: const Text(
                "See All",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),

        // this will show the featured courses in horizental listView
        SizedBox(
          height: 200,
          child: ListView.builder(itemBuilder: (context, index){

          }),
        ),

      ],
    );
  }
}
