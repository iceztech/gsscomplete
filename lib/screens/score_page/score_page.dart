import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/screens/review_answers_page/review_answers_page.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  border: Border(
                    bottom: BorderSide(color: kSecondaryColor, width: 3),
                  )),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SafeArea(
                    child: Text(
                      'Very Poor!!! go back to Summary',
                      style: TextStyle(color: kTextWhiteColor),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: kTextWhiteColor, width: 3),
                              ),
                              child: Center(
                                child: Text(
                                  'F',
                                  style: TextStyle(
                                      color: kTextWhiteColor,
                                      fontSize: 50,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -1,
                              child: Container(
                                height: 20,
                                width: 100,
                                color: kansBgColor,
                                child: Center(
                                  child: Text(
                                    'Failed',
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 12),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                  color: kTextWhiteColor, fontSize: 20),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Your Score',
                              style: TextStyle(
                                  color: kTextWhiteColor, fontSize: 13),
                            ),
                            Container(
                                height: 1,
                                width: 100,
                                color: kPrimaryLighterColor),
                            SizedBox(height: 20),
                            Text(
                              '0',
                              style: TextStyle(
                                  color: kTextWhiteColor, fontSize: 20),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Highest Score',
                              style: TextStyle(
                                  color: kTextWhiteColor, fontSize: 13),
                            ),
                            Container(
                                height: 1,
                                width: 100,
                                color: kPrimaryLighterColor),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    '0%',
                    style: TextStyle(color: kTextWhiteColor, fontSize: 30),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buildCorFaiContainer(
                      iconData: Icons.check_circle,
                      title: 'Correct',
                      number: '0'),
                  SizedBox(
                    height: 5,
                  ),
                  _buildCorFaiContainer(
                      iconData: Icons.close,
                      title: 'Failed',
                      number: '25',
                      textColor: kSecondaryColor),
                ],
              )),
          Spacer(),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _circularIcon(
                      bgcolor: kPrimaryColor,
                      height: 50,
                      icon: Icons.home_rounded,
                      width: 50,
                      title: 'Study Home',
                      borderColor: Colors.white,
                      onTap: () {},
                      txtcolor: kSecondaryColor),
                  _circularIcon(
                      bgcolor: kSecondaryColor,
                      height: 50,
                      icon: Icons.sync,
                      width: 50,
                      title: 'Play Again',
                      onTap: () {
                        //kopenPage(context, SelectCourseStudyType());
                      },
                      borderColor: Colors.grey.withOpacity(0.6),
                      txtcolor: kPrimaryColor),
                  _circularIcon(
                      bgcolor: kPrimaryColor,
                      height: 50,
                      icon: Icons.lightbulb,
                      width: 50,
                      title: 'Review',
                      onTap: () {
                        kopenPage(context, ReviewPage());
                      },
                      borderColor: Colors.white,
                      txtcolor: kSecondaryColor)
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildCorFaiContainer(
      {required IconData iconData,
      required String title,
      required String number,
      Color textColor = kBlackColor}) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - 32,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    size: 18,
                    color: kSecondaryColor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    title,
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                ],
              ),
              Text(
                number,
                style: TextStyle(color: textColor, fontSize: 18),
              ),
            ],
          ),
        ),
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
}
