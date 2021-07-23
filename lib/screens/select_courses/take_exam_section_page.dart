import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/components/answers_container.dart';
import 'package:gsscomplete/screens/score_page/score_page.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

class TakeExamSection extends StatefulWidget {
  const TakeExamSection({Key? key}) : super(key: key);

  @override
  _TakeExamSectionState createState() => _TakeExamSectionState();
}

class _TakeExamSectionState extends State<TakeExamSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            height: 80,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                border: Border(
                  bottom: BorderSide(color: kSecondaryColor, width: 3),
                )),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Score: 2,354',
                        style: TextStyle(color: kSecondaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Time Remaining: 13:09',
                        style: TextStyle(color: kTextWhiteColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          QuestionContainer(),
          SizedBox(
            height: 10,
          ),
          AnswerExamContainer(
            alphabet: 'A',
            answer: 'Austria',
          ),
          AnswerExamContainer(
            alphabet: 'B',
            answer: 'Britain',
          ),
          AnswerExamContainer(
            alphabet: 'C',
            answer: 'USA',
          ),
          AnswerExamContainer(
            alphabet: 'D',
            answer: 'Norway',
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _circularIcon(
                  bgcolor: kPrimaryColor,
                  height: 60,
                  icon: Icons.arrow_back_ios,
                  width: 60,
                  title: '',
                  borderColor: Colors.white,
                  onTap: () {},
                  txtcolor: kSecondaryColor),
              GestureDetector(
                onTap: () {
                  kopenPage(context, ScorePage());
                },
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              _circularIcon(
                  bgcolor: kPrimaryColor,
                  height: 60,
                  icon: Icons.arrow_forward_ios,
                  width: 60,
                  title: '',
                  borderColor: Colors.white,
                  onTap: () {},
                  txtcolor: kSecondaryColor),
            ],
          )
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
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }
}

class QuestionContainer extends StatelessWidget {
  const QuestionContainer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.only(top: 20),
            elevation: 8,
            shadowColor: kCardShadowColor,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'The first European to set a foot in Nigeria soil is ',
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 15),
            width: 30,
            height: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
            child: Center(
                child: Text(
              '1',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
