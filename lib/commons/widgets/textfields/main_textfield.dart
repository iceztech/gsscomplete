import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalFields extends StatelessWidget {
  final int maxLength;
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
      this.maxLength = 200});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: TextFormField(
        maxLength: maxLength,
        maxLines: 1,
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
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kSecondaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kSecondaryColor),
          ),
          hintText: hintText,
          labelText: labelText,
          counterText: "",
          hintStyle: TextStyle(color: Colors.black38, fontSize: 16.0),
        ),
      ),
    );
  }
}
