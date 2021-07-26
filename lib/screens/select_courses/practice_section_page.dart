import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gsscomplete/commons/components/answers_container.dart';
import 'package:gsscomplete/models/static_data/question_data.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class PracticePage extends StatefulWidget {
  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  late bool isForward, isBackward;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index'],
        ),
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
  int get numOfCorrectAns => this._numOfCorrectAns;

  void checkAns(Question question, int selectedIndex) {
    setState(() {
      _isAnswered = true;
      _correctAns = question.answer;
      _selectedAns = selectedIndex;
    });
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
      backgroundColor: Colors.white70.withOpacity(0.99),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: 180,
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: 180,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  border: Border(
                    bottom: BorderSide(color: kSecondaryColor, width: 3),
                  )),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            questionNum.toString() +
                                "/" +
                                _questions.length.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(height: 10),
                      Text(
                        '$questionNum.  ' + questions[_questionNumber].question,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AnswerPracticeContainer(
            alphabet: 'A',
            answer: questions[_questionNumber].options[0],
            press: () {
              checkAns(questions[_questionNumber], 0);
            },
            index: 0,
            correctAns: questions[_questionNumber].answer,
            isAnswered: isAnswered,
            selectedAns: selectedAns,
          ),
          AnswerPracticeContainer(
            alphabet: 'B',
            answer: questions[_questionNumber].options[1],
            press: () {
              checkAns(questions[_questionNumber], 1);
            },
            index: 1,
            correctAns: questions[_questionNumber].answer,
            isAnswered: isAnswered,
            selectedAns: selectedAns,
          ),
          AnswerPracticeContainer(
            alphabet: 'C',
            answer: questions[_questionNumber].options[2],
            press: () {
              checkAns(questions[_questionNumber], 2);
            },
            index: 2,
            correctAns: questions[_questionNumber].answer,
            isAnswered: isAnswered,
            selectedAns: selectedAns,
          ),
          AnswerPracticeContainer(
            alphabet: 'D',
            answer: questions[_questionNumber].options[3],
            press: () {
              checkAns(questions[_questionNumber], 3);
            },
            index: 3,
            correctAns: questions[_questionNumber].answer,
            isAnswered: isAnswered,
            selectedAns: selectedAns,
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
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
                _circularIcon(
                  bgcolor: kPrimaryColor,
                  height: 50,
                  icon: Icons.stop,
                  width: 50,
                  title: '',
                  onTap: () {},
                  borderColor: Colors.grey.withOpacity(0.6),
                ),
                Visibility(
                  visible: isForward,
                  child: _circularIcon(
                    bgcolor: kPrimaryColor,
                    height: 60,
                    icon: Icons.arrow_forward_ios,
                    width: 60,
                    title: '',
                    onTap: () {
                      setState(() {
                        nextQuestion();
                      });
                    },
                    borderColor: Colors.white,
                  ),
                )
              ],
            ),
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
}
