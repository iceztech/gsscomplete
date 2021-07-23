import 'package:flutter/cupertino.dart';
import 'package:gsscomplete/models/static_data/slider.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width * 0.6,
          width: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      Sliders.sliderArrayList[index].sliderImageUrl))),
        ),
        SizedBox(
          height: 40.0,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              Sliders.sliderArrayList[index].sliderHeading,
              style: kHeadingextStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              Sliders.sliderArrayList[index].sliderSubHeading,
              style: kSubheadingTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
        )
      ],
    );
  }
}
