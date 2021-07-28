import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/models/static_data/answer_review_data.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class ReviewPage extends StatefulWidget {
  final List<AnswerReview> answerReview;

  const ReviewPage({Key? key, required this.answerReview}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Answers Review', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            reviewListView(context),
          ],
        ),
      ),
    );
  }

  Container reviewListView(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: widget.answerReview.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) {
          return Container(
            child: _buildReviewList(
                questions: widget.answerReview[index].question,
                correctAnswer: widget.answerReview[index].correctAnswer,
                wrongAnswer: widget.answerReview[index].wrongAnswer),
          );
        },
      ),
    );
  }

  Widget _buildReviewList(
      {required String questions,
      required String correctAnswer,
      required String wrongAnswer}) {
    return Stack(
      children: [
        Container(
            child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(questions,
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  answerIndicator(
                      iconColor: Colors.red,
                      textColor: Colors.grey,
                      option: wrongAnswer),
                  answerIndicator(
                      iconColor: Colors.green,
                      textColor: Colors.black,
                      option: correctAnswer),
                ],
              )
            ]),
          ),
        )),
      ],
    );
  }

  Column answerIndicator(
      {required Color iconColor,
      required Color textColor,
      required String option}) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          width: 20,
          height: 2,
          alignment: Alignment.center),
      SizedBox(height: 2),
      Text(option, style: TextStyle(color: textColor, fontSize: 14))
    ]);
  }
}
