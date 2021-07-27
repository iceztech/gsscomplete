import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalFields extends StatelessWidget {
  final int maxLength, maxLines;
  final String labelText;
  final String hintText;
  final Function onChanged;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool isEditable;

  const NormalFields(
      {required this.labelText,
      required this.hintText,
      required this.onChanged,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.isEditable = true,
      this.maxLength = 200,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (maxLines > 1) ? 130 : 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: TextField(
          maxLength: maxLength,
          maxLines: maxLines,
          cursorColor: kSecondaryColor,
          enabled: isEditable,
          controller: controller,
          onChanged: (String name) => onChanged,
          keyboardType: textInputType,
          style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: InputBorder.none,
            hintText: hintText,
            labelText: labelText,
            counterText: "",
            labelStyle: TextStyle(color: Colors.black54, fontSize: 16.0),
            hintStyle: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
