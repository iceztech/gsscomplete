import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/widgets/buttons/custom_button.dart';
import 'package:gsscomplete/commons/widgets/textfields/border_textfield.dart';
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
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Register', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Enter your personal\ninformation to sign up',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Full Name',
              style: TextStyle(fontSize: 14),
            ),
            BorderFields(
              controller: TextEditingController(text: ''),
              hintText: 'Enter your name',
              isEditable: true,
              onChanged: () {},
              textInputType: TextInputType.name,
              labelText: '',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 14),
            ),
            BorderFields(
              controller: TextEditingController(text: ''),
              hintText: 'Enter your phone number',
              isEditable: true,
              onChanged: () {},
              textInputType: TextInputType.phone,
              labelText: '',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Email Address',
              style: TextStyle(fontSize: 14),
            ),
            BorderFields(
              controller: TextEditingController(text: ''),
              hintText: 'Enter your email address',
              isEditable: true,
              onChanged: () {},
              textInputType: TextInputType.emailAddress,
              labelText: '',
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
