import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/widgets/buttons/custom_button.dart';
import 'package:gsscomplete/commons/widgets/textfields/main_textfield.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

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
          leading: GestureDetector(
              onTap: () {
                kbackBtn(context);
              },
              child: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back)),
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Feedback Here...',
                  style: TextStyle(
                      color: kBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Name*',
                  style: TextStyle(color: kBlackColor, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                NormalFields(
                  controller: TextEditingController(text: ''),
                  hintText: '',
                  labelText: 'enter name',
                  isEditable: true,
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Phone Number*',
                  style: TextStyle(color: kBlackColor, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                NormalFields(
                  controller: TextEditingController(text: ''),
                  hintText: '',
                  labelText: 'enter phone number',
                  isEditable: true,
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Feedback Comment*',
                  style: TextStyle(color: kBlackColor, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                NormalFields(
                  controller: TextEditingController(text: ''),
                  hintText: '',
                  maxLines: 10,
                  labelText: 'comment here...',
                  isEditable: true,
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Center(
                    child: Text(
                      '         What can we improve?\nYour feedback is always welcome.!!!',
                      style: TextStyle(color: kBlackColor, fontSize: 14),
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
