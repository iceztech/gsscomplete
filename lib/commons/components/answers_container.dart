import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class AnswerPracticeContainer extends StatefulWidget {
  final String alphabet, answer;
  final Color bgColor;
  final VoidCallback press;
  final bool isAnswered;
  final int index;
  final int correctAns, selectedAns;

  const AnswerPracticeContainer(
      {required this.alphabet,
      required this.answer,
      this.bgColor = Colors.white,
      required this.press,
      required this.isAnswered,
      required this.index,
      required this.correctAns,
      required this.selectedAns});

  @override
  _AnswerPracticeContainerState createState() =>
      _AnswerPracticeContainerState();
}

class _AnswerPracticeContainerState extends State<AnswerPracticeContainer> {
  @override
  Widget build(BuildContext context) {
    Color getTheRightColor() {
      if (widget.isAnswered) {
        if (widget.index == widget.correctAns) {
          return kGreenColor;
        } else if (widget.index == widget.selectedAns &&
            widget.selectedAns != widget.correctAns) {
          return kRedColor;
        }
      }
      return Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            getTheRightColor();
            widget.press();
          });
        },
        child: Card(
          color: getTheRightColor() == Colors.grey
              ? Colors.transparent
              : getTheRightColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                      child: Text(
                        widget.alphabet,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.answer,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnswerExamContainer extends StatelessWidget {
  final String alphabet, answer;
  final Color bgColor;
  final Function press;
  const AnswerExamContainer(
      {required this.alphabet,
      required this.answer,
      this.bgColor = Colors.white,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: () {
          press();
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          elevation: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 55,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      alphabet,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  answer,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
