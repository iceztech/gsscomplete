import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/widgets/buttons/custom_button.dart';
import 'package:gsscomplete/commons/widgets/textfields/border_textfield.dart';
import 'package:gsscomplete/commons/widgets/textfields/main_textfield.dart';
import 'package:gsscomplete/screens/payment_pages/payment_method_pages.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Register', style: TextStyle(color: Colors.white)),
        leading: GestureDetector(
            onTap: () {
              kbackBtn(context);
            },
            child:
                Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Enter your personal\ninformation to sign up',
              style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Full Name',
              style: TextStyle(fontSize: 14, color: kPrimaryColor),
            ),
            NormalFields(
              controller: TextEditingController(text: ''),
              hintText: '',
              labelText: '',
              isEditable: true,
              onChanged: (String value) {},
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 14, color: kPrimaryColor),
            ),
            NormalFields(
              controller: TextEditingController(text: ''),
              hintText: '',
              labelText: '',
              isEditable: true,
              onChanged: (String value) {},
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Email Address',
              style: TextStyle(fontSize: 14, color: kPrimaryColor),
            ),
            NormalFields(
              controller: TextEditingController(text: ''),
              hintText: '',
              labelText: '',
              isEditable: true,
              onChanged: (String value) {},
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              text: 'Sign up',
              onPressed: () {
                kopenPage(context, PaymentPage());
              },
              borderRadius: 0,
              disableButton: true,
              margin: 0,
            ),
          ],
        ),
      ),
    );
  }
}
