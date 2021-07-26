import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/widgets/buttons/custom_button.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kansBgColor,
        appBar: AppBar(
          title: Text('Feedback'),
          centerTitle: false,
          automaticallyImplyLeading: true,
          leading:
              Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Feedback Here...',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '*Name',
                  style: TextStyle(color: kPrimaryColor, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "",
                          hintStyle: TextStyle(fontSize: 16.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '*Phone Number',
                  style: TextStyle(color: kPrimaryColor, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "",
                          hintStyle: TextStyle(fontSize: 16.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '*Feedback comment',
                  style: TextStyle(color: kPrimaryColor, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                        maxLines: 5,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "not more than 100 words",
                          hintStyle: TextStyle(fontSize: 16.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Center(
                    child: Text(
                      '         What can we improve?\nYour feedback is always welcome.!!!',
                      style: TextStyle(color: kPrimaryColor, fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(text: 'SEND', onPressed: () {})
              ],
            ),
          ),
        ));
  }
}
