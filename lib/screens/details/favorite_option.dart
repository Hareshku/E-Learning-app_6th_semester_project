import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model/course.dart';

class FavoriteOption extends StatefulWidget {
  const FavoriteOption({Key? key, required this.course}) :super(key: key);

  final Course course;
  @override
  State<FavoriteOption> createState() => _FavoriteOptionState();
}

class _FavoriteOptionState extends State<FavoriteOption> {
  bool isFavorite=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite=widget.course.isFavorite;
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:(){
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final CollectionReference courseRef = FirebaseFirestore.instance.collection('user').doc(uid).collection('wishList');
      courseRef.add(
          {'thumbnail':widget.course.thumbnailUrl,'title':widget.course.title,'createdBy':widget.course.createdBy,'rate':widget.course.rate,'price':widget.course.price,'duration':widget.course.duration,'lesson':widget.course.lessonNo});

      setState(() {
        isFavorite= !isFavorite;
        widget.course.isFavorite=isFavorite;

      });
    },
        icon: Icon(
          isFavorite? Icons.favorite: Icons.favorite_border,
          color: Colors.pink,));
  }
}