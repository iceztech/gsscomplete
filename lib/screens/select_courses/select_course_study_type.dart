import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/models/static_data/course_lists.dart';
import 'package:gsscomplete/screens/select_courses/take_exam_section_page.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

import 'practice_section_page.dart';
import 'summary_section_page.dart';

class SelectCourseStudyType extends StatefulWidget {
  @override
  _SelectCourseStudyTypeState createState() => _SelectCourseStudyTypeState();
}

class _SelectCourseStudyTypeState extends State<SelectCourseStudyType>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<CourseData> courseData = [];

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
    courseData = CourseList.courseList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: kPrimaryColor,
        title: new Text("Select Course", style: TextStyle(fontSize: 18)),
        bottom: TabBar(
          isScrollable: false,
          tabs: [
            new Tab(text: 'SUMMARY'),
            new Tab(
              text: 'PRACTICE',
            ),
            new Tab(
              text: 'TAKE EXAM',
            ),
          ],
          controller: _tabController,
          unselectedLabelColor: kSecondaryColor,
          unselectedLabelStyle: TextStyle(fontSize: 16),
          labelStyle: TextStyle(fontSize: 16),
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: kSecondaryColor.withOpacity(0.6),
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          listViewClasses('summary'),
          listViewClasses('practice'),
          listViewClasses('exam'),
        ],
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Chat',
        child: Icon(Icons.message),
      ),
    );
  }

  Widget listViewClasses(String listType) {
    return ListView.builder(
        itemCount: CourseList.courseList.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return _courseList(
              imgUrl: CourseList.courseList[i].imageUrl,
              courseTitle: CourseList.courseList[i].courseTitle,
              subTitle: CourseList.courseList[i].courseSubtitle,
              color: CourseList.courseList[i].color,
              onTap: () {
                if (listType == 'practice') {
                  kopenPage(context, PracticePage());
                } else if (listType == 'exam') {
                  kopenPage(context, TakeExamSection());
                } else if (listType == 'summary') {
                  kopenPage(context, SummarySection());
                }
              });
        });
  }

  Widget _courseList({
    required String imgUrl,
    required String courseTitle,
    required String subTitle,
    required Color color,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          height: 80,
          child: Card(
            elevation: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: kSecondaryColor.withOpacity(0.4), width: 4),
                        image: DecorationImage(
                            image: AssetImage(imgUrl), fit: BoxFit.contain),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseTitle,
                          style: TextStyle(
                            color: color,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          subTitle,
                          style: TextStyle(
                            color: color,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                    size: 14,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
