import 'package:flutter/material.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double width;
  final double height;
  final double margin;
  final double borderRadius;
  final bool disableButton;

  const CustomButton(
      {required this.text,
      required this.onPressed,
      this.width = double.infinity,
      this.height = 45,
      this.margin = 8.0,
      this.borderRadius = 3.0,
      this.disableButton = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        (disableButton) ? onPressed() : null;
      },
      child: Container(
        margin: EdgeInsets.all(margin),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: (disableButton) ? kPrimaryColor : kGrayColor,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: kTextWhiteColor,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
