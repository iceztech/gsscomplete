import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/models/static_data/activation_category_data.dart';
import 'package:gsscomplete/models/static_data/course_imageList.dart';
import 'package:gsscomplete/screens/select_courses/profile_page.dart';
import 'package:gsscomplete/screens/select_courses/select_course_study_type.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

class ProfileCoursePage extends StatefulWidget {
  const ProfileCoursePage({Key? key}) : super(key: key);

  @override
  _ProfileCoursePageState createState() => _ProfileCoursePageState();
}

class _ProfileCoursePageState extends State<ProfileCoursePage> {
// Default Radio Button Item
  String radioItem = 'Single Semester (NGN 500)';

  // Group Value for Radio Button.
  int id = 1;
  List<Activation> activate = ActivationData.extraActivation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bc.jpg'), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 86,
                    height: 86,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: kSecondaryColor.withOpacity(0.4), width: 4),
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chibueze',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 160,
                        child: Text(
                          'Electronic and Computer Enginering ',
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.white, fontSize: 14, height: 1.3),
                        ),
                      ),
                    ],
                  ),
                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            kopenPage(context, ProfilePage());
                          },
                          child: Icon(
                            Icons.menu_open,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            showInfoDialog(
                                height: 330,
                                widgets: dialogBodyActivation(),
                                actionText: 'CONTINUE',
                                onTap: () {});
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 4.0),
                            child: Text(
                              'Activate More',
                              style: TextStyle(
                                  color: kSecondaryColor, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        color: kPrimaryLighterColor,
                        border: Border(
                          bottom: BorderSide(color: kSecondaryColor, width: 3),
                          right: BorderSide(color: kPrimaryColor, width: 2),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                              color: kTextWhiteColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Total Score',
                          style:
                              TextStyle(color: kTextWhiteColor, fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        )
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        color: kPrimaryLighterColor,
                        border: Border(
                          bottom: BorderSide(color: kSecondaryColor, width: 3),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Highest Score: GSS110',
                          style:
                              TextStyle(color: kTextWhiteColor, fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        )
                      ],
                    )),
              ),
            ],
          ),
          Container(
            height: 150,
            color: kSecondaryColor.withOpacity(0.4),
            child: ListView.builder(
                itemCount: CourseImageList.courseImage.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return SizedBox(
                    width: 120,
                    child: Container(
                        child: Image.asset(CourseImageList.courseImage[i])),
                  );
                }),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: kSecondaryColor.withOpacity(0.4),
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0, bottom: 3.0),
              child: Text(
                'Check For Data Update / Correction',
                style: TextStyle(color: kBlackColor, fontSize: 16),
              ),
            ),
          ),
          Spacer(),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _circularIcon(
                      bgcolor: kPrimaryColor,
                      height: 50,
                      icon: Icons.home,
                      width: 50,
                      title: 'Home',
                      borderColor: Colors.white,
                      onTap: () {},
                      txtcolor: kSecondaryColor),
                  _circularIcon(
                      bgcolor: kSecondaryColor,
                      height: 65,
                      icon: Icons.play_arrow,
                      width: 65,
                      title: 'Start',
                      onTap: () {
                        kopenPage(context, SelectCourseStudyType());
                      },
                      borderColor: Colors.grey.withOpacity(0.6),
                      txtcolor: kPrimaryColor),
                  _circularIcon(
                      bgcolor: kPrimaryColor,
                      height: 50,
                      icon: Icons.message,
                      width: 50,
                      title: 'Discussion',
                      onTap: () {},
                      borderColor: Colors.white,
                      txtcolor: kSecondaryColor)
                ],
              ))
        ],
      ),
    );
  }

  Widget _circularIcon(
      {required double height,
      required double width,
      required IconData icon,
      required Color bgcolor,
      required Color txtcolor,
      required Color borderColor,
      required String title,
      required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgcolor,
              border: Border.all(color: borderColor, width: 4),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: TextStyle(color: txtcolor, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  showInfoDialog(
      {required double height,
      required Widget widgets,
      required String actionText,
      required Function onTap}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 25.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Stack(
                children: [
                  Container(
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: widgets,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Text('CANCEL',
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontSize: 16)),
                                ),
                                SizedBox(width: 16),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    onTap();
                                  },
                                  child: Text(actionText,
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontSize: 16)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        });
  }

  Widget dialogBodyActivation() {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 15,
            ),
            Text('Select Category',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: activate.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Text("${activate[index].name}"),
                    groupValue: id,
                    value: activate[index].index,
                    onChanged: (val) {
                      setState(() {
                        radioItem = activate[index].name;
                        id = activate[index].index;
                      });
                    },
                  );
                })
          ])),
    );
  }
}
