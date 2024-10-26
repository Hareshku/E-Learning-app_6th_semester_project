import 'dart:async';

import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  int _selectedPromo = 0;

  List<Image> widgetList = [
    Image.asset('images/offer/offer1.png'),
    Image.asset('images/offer/offer2.png'),
    Image.asset('images/offer/offer3.png'),
  ];

  late Timer timer;

  final PageController page_Controller = PageController();

  // this will move the offer automatically with timer
  @override
  void initState() {
    // todo implement initState
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_selectedPromo < 2) {
        _selectedPromo++;
      } else {
        _selectedPromo = 0;
      }
      if (page_Controller.positions.isNotEmpty) {
        page_Controller.animateToPage(_selectedPromo,
            duration: const Duration(microseconds: 400),
            curve: Curves.easeIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        PageView.builder(
          controller: page_Controller,
          itemCount: widgetList.length,
          itemBuilder: (context, index) {
            return widgetList[index];
          },
          onPageChanged: (int selectedPage) {
            setState(() {
              _selectedPromo = selectedPage;
            });
          },
        ),
        // lets build dot indicator
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < widgetList.length; index++)
                if (index == _selectedPromo) ...[createCircle(true)] else
                  createCircle(false)
            ],
          ),
        ),
      ]), ////
    );
  }

  // write a function to create dot & call this function from above for loop
  Widget createCircle(bool isCurrent) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isCurrent ? 12 : 8,
      width: isCurrent ? 12 : 8,
      decoration: BoxDecoration(
        color: isCurrent ? Colors.orange : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
