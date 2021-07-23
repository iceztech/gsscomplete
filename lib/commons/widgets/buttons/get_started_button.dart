import 'package:gsscomplete/utils/constants/general_constants.dart';

import 'package:flutter/material.dart';

class GetStartedButton extends StatefulWidget {
  @override
  _GetStartedButtonState createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45.0,
        width: 90.0,
        child: Container(
          decoration: BoxDecoration(
            color: kTransparent,
            border: Border.all(width: 2.0, color: kTextWhiteColor),
            borderRadius: BorderRadius.all(
                Radius.circular(30.0) //                 <--- border radius here
                ),
          ),
          child: Center(
            child: Text(
              'GET STARTED',
              style: kBodyTextStyle,
            ),
          ),
        ));
  }
}
