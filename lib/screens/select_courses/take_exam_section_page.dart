import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/components/answers_container.dart';
import 'package:gsscomplete/models/static_data/answer_review_data.dart';
import 'package:gsscomplete/models/static_data/question_data.dart';
import 'package:gsscomplete/screens/score_page/score_page.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';
import 'package:intl/intl.dart';

class TakeExamSection extends StatefulWidget {
  const TakeExamSection({Key? key}) : super(key: key);

  @override
  _TakeExamSectionState createState() => _TakeExamSectionState();
}

class _TakeExamSectionState extends State<TakeExamSection> {
  int _counter = 4001;
  late Timer _timer;
  List<int> scores = [];
  var totalScores;

  List<AnswerReview> answerReview = [];

  void _startTimer() {
    _counter = 4001;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

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

  late int _selectedAns = 0;
  int get selectedAns => this._selectedAns;

  int _questionNumber = 0;

  late int questionNum;

  int _numOfCorrectAns = 0;
  int _numOfWrongAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  void checkAns(
      {required Question question,
      required int selectedIndex,
      required String questionNum}) {
    setState(() {
      _isAnswered = true;
      _correctAns = question.answer;
      _selectedAns = selectedIndex;
    });
    if (_questionNumber != _questions.length - 1) {
      if (_correctAns == _selectedAns) {
        _numOfCorrectAns++;
        print(_numOfCorrectAns);
      } else {
        answerReview.add(AnswerReview(
            question: questionNum + ". " + question.question,
            correctAnswer: optionAlpha(selectedIndex) +
                ". " +
                question.options[_correctAns],
            wrongAnswer: optionAlpha(_correctAns) +
                ". " +
                question.options[_selectedAns]));
      }
    } else if (_questionNumber == _questions.length - 1) {
      if (_correctAns == _selectedAns) {
        _numOfCorrectAns++;
        print(_numOfCorrectAns);
      }
      _addScores();
      if (_numOfCorrectAns != 0) {
        _numOfWrongAns = _questions.length - _numOfCorrectAns;
      } else {
        _numOfWrongAns = _questions.length;
      }
      Future.delayed(Duration(seconds: 3), () {
        kopenPage(
            context,
            ScorePage(
              score: totalScores,
              correctAns: _numOfCorrectAns,
              wrongAns: _numOfWrongAns,
              answerReview: answerReview,
            ));
      });
    } else {}
  }

  void nextQuestion() {
    scores.add(_counter);
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
    _startTimer();
    questions.shuffle();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.99),
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
                        'Score: $_counter',
                        style: TextStyle(color: kSecondaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Time Remaining: ${f.format(_minutes)} : ${f.format(_seconds)}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          questionContainer(
              questionNumber: questionNum.toString(),
              question: questions[_questionNumber].question),
          SizedBox(
            height: 10,
          ),
          AnswerExamContainer(
            alphabet: 'A',
            answer: questions[_questionNumber].options[0],
            press: () {
              checkAns(
                  question: questions[_questionNumber],
                  selectedIndex: 0,
                  questionNum: questionNum.toString());
              scores.add(_counter);
            },
            index: 0,
            correctAns: questions[_questionNumber].answer,
            isAnswered: isAnswered,
            selectedAns: selectedAns,
          ),
          AnswerExamContainer(
            alphabet: 'B',
            answer: questions[_questionNumber].options[1],
            press: () {
              checkAns(
                  question: questions[_questionNumber],
                  selectedIndex: 1,
                  questionNum: questionNum.toString());

              scores.add(_counter);
            },
            index: 1,
            correctAns: questions[_questionNumber].answer,
            isAnswered: isAnswered,
            selectedAns: selectedAns,
          ),
          AnswerExamContainer(
            alphabet: 'C',
            answer: questions[_questionNumber].options[2],
            press: () {
              checkAns(
                  question: questions[_questionNumber],
                  selectedIndex: 2,
                  questionNum: questionNum.toString());

              scores.add(_counter);
            },
            index: 2,
            correctAns: questions[_questionNumber].answer,
            isAnswered: isAnswered,
            selectedAns: selectedAns,
          ),
          AnswerExamContainer(
            alphabet: 'D',
            answer: questions[_questionNumber].options[3],
            press: () {
              checkAns(
                  question: questions[_questionNumber],
                  selectedIndex: 3,
                  questionNum: questionNum.toString());

              scores.add(_counter);
            },
            index: 3,
            correctAns: questions[_questionNumber].answer,
            isAnswered: isAnswered,
            selectedAns: selectedAns,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              (isBackward)
                  ? _circularIcon(
                      bgcolor: kPrimaryColor,
                      height: 55,
                      icon: Icons.arrow_back_ios,
                      width: 55,
                      title: '',
                      borderColor: Colors.white,
                      onTap: () {
                        setState(() {
                          previousQuestion();
                        });
                      },
                    )
                  : Container(
                      height: 55,
                      width: 55,
                    ),
              GestureDetector(
                onTap: () {
                  if (scores.isEmpty) {
                    scores.add(_counter);
                    _addScores();
                    Future.delayed(Duration(seconds: 2), () {
                      kopenPage(
                          context,
                          ScorePage(
                            score: totalScores,
                            correctAns: _numOfCorrectAns,
                            wrongAns: _numOfWrongAns,
                            answerReview: answerReview,
                          ));
                    });
                  } else {
                    _addScores();
                    Future.delayed(Duration(seconds: 2), () {
                      kopenPage(
                          context,
                          ScorePage(
                            score: totalScores,
                            correctAns: _numOfCorrectAns,
                            wrongAns: _numOfWrongAns,
                            answerReview: answerReview,
                          ));
                    });
                  }
                  if (_numOfCorrectAns != 0) {
                    _numOfWrongAns = _questions.length - _numOfCorrectAns;
                  } else {
                    _numOfWrongAns = _questions.length;
                  }
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
              (isForward)
                  ? _circularIcon(
                      bgcolor: kPrimaryColor,
                      height: 55,
                      icon: Icons.arrow_forward_ios,
                      width: 55,
                      title: '',
                      onTap: () {
                        setState(() {
                          nextQuestion();
                        });
                      },
                      borderColor: Colors.white,
                    )
                  : Container(
                      height: 55,
                      width: 55,
                    )
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
              size: 18,
            ),
          ),
          SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }

  Widget questionContainer(
      {required String questionNumber, required String question}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.only(top: 20),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  question,
                  style: TextStyle(fontSize: 16),
                ),
              ),
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

  int _seconds = 00;
  int _minutes = 15;
  late Timer _timerCount;
  var f = NumberFormat("00");

  void _addScores() {
    totalScores = scores.reduce((i, j) => i + j);
    print(totalScores);
  }

  String optionAlpha(int a) {
    if (a == 0) {
      return 'A';
    } else if (a == 1) {
      return 'B';
    } else if (a == 2) {
      return 'C';
    } else if (a == 3) {
      return 'D';
    }
    return '';
  }
}
