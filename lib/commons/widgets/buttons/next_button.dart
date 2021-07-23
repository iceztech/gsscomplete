import 'package:gsscomplete/utils/constants/general_constants.dart';

import 'package:flutter/material.dart';

class NextButton extends StatefulWidget {
  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45.0,
        width: 90.0,
        child: Container(
          color: kTextWhiteColor,
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ));
  }
}
