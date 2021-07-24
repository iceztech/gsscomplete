import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gsscomplete/commons/components/answers_container.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/models/static_data/question_data.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  late List<Question> _questions = sample_data
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

  int _questionNumber = 1;
  int get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    
  }

  void nextQuestion() {
    if (_questionNumber != _questions.length) {
      _isAnswered = false;
      _questionNumber++;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kansBgColor,
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
                            '1/30',
                            style: TextStyle(color: kSecondaryColor),
                          )),
                      SizedBox(height: 10),
                      Text(
                        questions[_questionNumber].question,
                        style: TextStyle(color: kTextWhiteColor),
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
          ),
          AnswerPracticeContainer(
            alphabet: 'B',
            answer: questions[_questionNumber].options[1],
          ),
          AnswerPracticeContainer(
            alphabet: 'C',
            answer: questions[_questionNumber].options[2],
          ),
          AnswerPracticeContainer(
            alphabet: 'D',
            answer: questions[_questionNumber].options[3],
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
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
                _circularIcon(
                    bgcolor: kSecondaryColor,
                    height: 50,
                    icon: Icons.stop,
                    width: 50,
                    title: '',
                    onTap: () {},
                    borderColor: Colors.grey.withOpacity(0.6),
                    txtcolor: kPrimaryColor),
                _circularIcon(
                    bgcolor: kPrimaryColor,
                    height: 60,
                    icon: Icons.arrow_forward_ios,
                    width: 60,
                    title: '',
                    onTap: () {},
                    borderColor: Colors.white,
                    txtcolor: kSecondaryColor)
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
