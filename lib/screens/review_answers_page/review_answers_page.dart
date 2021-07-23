import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class ReviewPage extends StatelessWidget {
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
        itemCount: 3,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) {
          return Container(
            child: transactionList(index),
          );
        },
      ),
    );
  }

  Widget transactionList(int index) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: (index == 0 ? 0 : 15)),
            height: 130,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '________ helps in bringing back peoples culture',
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
                          option: 'D. Religion'),
                      answerIndicator(
                          iconColor: Colors.green,
                          textColor: Colors.black,
                          option: 'A. Theatre art'),
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
