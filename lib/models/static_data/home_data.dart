import 'package:flutter/material.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class HomeData {
  static List<HomeMenu> get homeData => [
        HomeMenu(
            title: "Study Section", icon: Icons.book, color: Colors.orange),
        HomeMenu(
          title: "Lecture Timetable",
          icon: Icons.calendar_today,
          color: kPrimaryLighterColor,
        ),
        HomeMenu(
            title: "Roommate Finder",
            icon: Icons.find_in_page,
            color: Colors.green),
        HomeMenu(
            title: "Gpa Calculator",
            icon: Icons.calculate,
            color: kSecondaryColor),
        HomeMenu(
            title: "Notifications", icon: Icons.mail, color: kPrimaryColor),
        HomeMenu(
            title: "Feedback",
            icon: Icons.featured_play_list,
            color: Colors.blue),
        HomeMenu(
            title: "Share App", icon: Icons.share, color: Colors.orangeAccent),
        HomeMenu(
          title: "Help",
          icon: Icons.help,
          color: Colors.black.withOpacity(0.8),
        ),
      ];
}

class HomeMenu {
  final String title;
  final IconData icon;
  final Color color;

  HomeMenu({
    required this.title,
    required this.icon,
    required this.color,
  });
}
