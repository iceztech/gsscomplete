import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/components/answers_container.dart';
import 'package:gsscomplete/models/static_data/question_data.dart';
import 'package:gsscomplete/screens/score_page/score_page.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

class TakeExamSection extends StatefulWidget {
  const TakeExamSection({Key? key}) : super(key: key);

  @override
  _TakeExamSectionState createState() => _TakeExamSectionState();
}

class _TakeExamSectionState extends State<TakeExamSection> {
  late bool isForward, isBackward;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  int _questionNumber = 0;

  late int questionNum;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  void checkAns(Question question, int selectedIndex) {
    setState(() {
      _isAnswered = true;
      _correctAns = question.answer;
      _selectedAns = selectedIndex;
    });
    if (_questionNumber != _questions.length - 1) {
      if (_correctAns == _selectedAns) {
        _numOfCorrectAns++;
        print(_numOfCorrectAns);
      }
      Future.delayed(Duration(seconds: 2), () {
        nextQuestion();
      });
    } else if (_questionNumber == _questions.length - 1) {
      if (_correctAns == _selectedAns) {
        _numOfCorrectAns++;
        print(_numOfCorrectAns);
        Future.delayed(Duration(seconds: 2), () {
          kopenPage(context, ScorePage());
        });
      }
    } else {}
  }

  void nextQuestion() {
    if (_questionNumber != _questions.length - 1) {
      setState(() {
        _isAnswered = false;
        _questionNumber++;
        questionNum++;
        isBackward = true;
      });
    } else {
      setState(() {
        isForward = false;
      });
    }
  }

  void previousQuestion() {
    if (_questionNumber >= 1) {
      setState(() {
        _isAnswered = false;
        _questionNumber--;
        questionNum--;

        isForward = true;
      });
    } else {
      setState(() {
        isForward = true;
        isBackward = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    questionNum = _questionNumber + 1;

    isForward = true;
    isBackward = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kansBgColor,
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
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          QuestionContainer(
              questionNumber: questionNum.toString(),
              question: questions[_questionNumber].question),
          SizedBox(
            height: 10,
          ),
          AnswerExamContainer(
            alphabet: 'A',
            answer: questions[_questionNumber].options[0],
            press: () {
              checkAns(questions[_questionNumber], 0);
            },
          ),
          AnswerExamContainer(
            alphabet: 'B',
            answer: questions[_questionNumber].options[1],
            press: () {
              checkAns(questions[_questionNumber], 1);
            },
          ),
          AnswerExamContainer(
            alphabet: 'C',
            answer: questions[_questionNumber].options[2],
            press: () {
              checkAns(questions[_questionNumber], 2);
            },
          ),
          AnswerExamContainer(
            alphabet: 'D',
            answer: questions[_questionNumber].options[3],
            press: () {
              checkAns(questions[_questionNumber], 3);
            },
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: isBackward,
                child: _circularIcon(
                  bgcolor: kPrimaryColor,
                  height: 60,
                  icon: Icons.arrow_back_ios,
                  width: 60,
                  title: '',
                  borderColor: Colors.white,
                  onTap: () {
                    setState(() {
                      previousQuestion();
                    });
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  //kopenPage(context, ScorePage());
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
              Visibility(
                visible: isForward,
                child: _circularIcon(
                  bgcolor: kPrimaryColor,
                  height: 60,
                  icon: Icons.arrow_forward_ios,
                  width: 60,
                  title: '',
                  borderColor: Colors.white,
                  onTap: () {
                    nextQuestion();
                  },
                ),
              ),
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

  Widget QuestionContainer(
      {required String questionNumber, required String question}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.only(top: 20),
            elevation: 8,
            // shadowColor: kCardShadowColor,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      question,
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
              questionNumber,
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
