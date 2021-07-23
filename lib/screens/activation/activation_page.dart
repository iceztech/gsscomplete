import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/widgets/buttons/custom_button.dart';
import 'package:gsscomplete/commons/widgets/textfields/main_textfield.dart';
import 'package:gsscomplete/screens/select_courses/profile_course_page.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

import 'activation_code_info_page.dart';

class ActivationPage extends StatefulWidget {
  const ActivationPage({Key? key}) : super(key: key);

  @override
  _ActivationPageState createState() => _ActivationPageState();
}

class _ActivationPageState extends State<ActivationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Activation',
          style: kHeadingextStyle,
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter Activation Code',
                    style: TextStyle(color: kPrimaryColor, fontSize: 18),
                  ),
                  Text(
                    'NGN 0',
                    style: TextStyle(color: kGreenColor, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              NormalFields(
                controller: TextEditingController(text: ''),
                hintText: 'Activation Code',
                labelText: 'Activation Code',
                isEditable: true,
                onChanged: (String value) {},
              ),
              SizedBox(
                height: 15,
              ),
              NormalFields(
                controller: TextEditingController(text: ''),
                hintText: 'Enter Your Name',
                labelText: 'Enter Your Name',
                isEditable: true,
                onChanged: (String value) {},
              ),
              SizedBox(
                height: 15,
              ),
              NormalFields(
                controller: TextEditingController(text: ''),
                hintText: 'Enter Phone Number',
                labelText: 'Enter Phone Number',
                isEditable: true,
                onChanged: (String value) {},
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                onPressed: () {
                  kopenPage(context, ProfileCoursePage());
                },
                margin: 0,
                disableButton: true,
                text: 'VERIFY',
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  kopenPage(context, ActivationPageInfo());
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  child: Card(
                    elevation: 8,
                    child: Center(
                      child: Text(
                        'Help on how to get Activation Code',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //     height: 70,
              //     color: kPayStackColor,
              //     width: MediaQuery.of(context).size.width,
              //     padding: EdgeInsets.all(8),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(left: 8.0),
              //           child: Icon(
              //             Icons.lock,
              //             color: Colors.white,
              //           ),
              //         ),
              //         Text(
              //           'Pay with ATM Card',
              //           style: TextStyle(
              //               color: kTextWhiteColor,
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold),
              //         ),
              //         Container()
              //       ],
              //     )),
              // SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 20.0),
              //   child: Image.asset('assets/images/paystack.png'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
