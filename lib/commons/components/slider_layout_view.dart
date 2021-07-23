import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:gsscomplete/commons/widgets/buttons/get_started_button.dart';
import 'package:gsscomplete/commons/widgets/buttons/next_button.dart';
import 'package:gsscomplete/commons/widgets/slide_dots.dart';
import 'package:gsscomplete/commons/widgets/slide_items/slide_item.dart';
import 'package:gsscomplete/models/static_data/slider.dart';
import 'package:gsscomplete/screens/landing_page/home_page.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  Color color = kPrimaryColor;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      switch (_currentPage) {
        case 0:
          color = kPrimaryColor;
          break;
        case 1:
          color = kSecondaryColor;
          break;
        case 2:
          color = kPrimaryLighterColor;
          break;
        case 3:
          color = kLightBlueColor;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  bool inFinalPage() {
    if (_currentPage == Sliders.sliderArrayList.length - 1) {
      return true;
    }
    return false;
  }

  Widget topSliderLayout() => Container(
        color: color,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07),
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: Sliders.sliderArrayList.length,
                itemBuilder: (ctx, i) {
                  return SlideItem(i);
                },
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                    child: Text('IcezTech Logo', style: kBodyTextStyle),
                  ),
                ),
                inFinalPage()
                    ? Positioned(
                        bottom: 70,
                        right: 30,
                        left: 30,
                        child: GestureDetector(
                            onTap: () {
                              pushPage(context, HomePage());
                            },
                            child: GetStartedButton()))
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0;
                                  i < Sliders.sliderArrayList.length;
                                  i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        ),
                      ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                    child: (_currentPage == 0)
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 10),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text(
                              'Back',
                              style: kBodyTextStyle,
                            ),
                          ),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 70,
                right: 14,
                child: inFinalPage()
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 10),
                            curve: Curves.easeIn,
                          );
                        },
                        child: NextButton())),
            Positioned(
                bottom: 42,
                right: 0,
                left: 0,
                child: Container(
                  color: kGrayColor,
                  height: 1,
                )),
          ],
        ),
      );
}
