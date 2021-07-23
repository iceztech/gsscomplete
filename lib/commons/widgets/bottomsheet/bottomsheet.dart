import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PersistentBottomSheetController buildShowBottomSheet(
    {required BuildContext context,
    required Widget bottomsheetContent,
    required double height}) {
  return showBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                height: height,
                width: MediaQuery.of(context).size.width,
                child: bottomsheetContent),
          ));
}
