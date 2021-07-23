import 'package:flutter/cupertino.dart';
import 'package:gsscomplete/models/static_data/summary_data.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class SummaryItem extends StatelessWidget {
  final int index;
  SummaryItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          SummaryData.summaryArrayList[index].summaryHeading,
          style: TextStyle(color: kSecondaryColor),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          SummaryData.summaryArrayList[index].summarySubHeading,
          style: TextStyle(color: kPrimaryColor),
        ),
        SizedBox(
          height: 25.0,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              SummaryData.summaryArrayList[index].summaryChapterAuthor,
              style: TextStyle(color: kBlackColor),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            SummaryData.summaryArrayList[index].summaryBody,
            style: TextStyle(color: kBlackColor),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
