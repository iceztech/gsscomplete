import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class CourseList {
  static List<CourseData> courseList = [
    CourseData(
        imageUrl: 'assets/images/gss107.png',
        courseTitle: 'GSS 107',
        courseSubtitle: 'Use of English 1',
        color: kPrimaryLighterColor),
    CourseData(
        imageUrl: 'assets/images/gss101.png',
        courseTitle: 'GSS 101',
        courseSubtitle: 'Humanities',
        color: kGreenColor),
    CourseData(
        imageUrl: 'assets/images/gss105.png',
        courseTitle: 'GSS 105',
        courseSubtitle: 'Nigerian People and Culture',
        color: kPrimaryColor),
    CourseData(
        imageUrl: 'assets/images/gss109.png',
        courseTitle: 'GSS 109',
        courseSubtitle: 'Igbo For Learners 1',
        color: kSecondaryColor),
  ];
}

class CourseData {
  final String imageUrl;
  final String courseTitle;
  final String courseSubtitle;
  final Color color;

  CourseData(
      {required this.imageUrl,
      required this.courseTitle,
      required this.courseSubtitle,
      required this.color});
}
