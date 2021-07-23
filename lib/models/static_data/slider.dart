import 'package:gsscomplete/utils/constants/general_constants.dart';

class Sliders {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Sliders(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading});

  static List<Sliders> sliderArrayList = [
    Sliders(
        sliderImageUrl: 'assets/images/welcome_b.png',
        sliderHeading: SLIDER_HEADING_1,
        sliderSubHeading: SLIDER_DESC1),
    Sliders(
        sliderImageUrl: 'assets/images/welcome_c.png',
        sliderHeading: SLIDER_HEADING_2,
        sliderSubHeading: SLIDER_DESC2),
    Sliders(
        sliderImageUrl: 'assets/images/welcome_d.png',
        sliderHeading: SLIDER_HEADING_3,
        sliderSubHeading: SLIDER_DESC3),
    Sliders(
        sliderImageUrl: 'assets/images/welcome_e.png',
        sliderHeading: SLIDER_HEADING_4,
        sliderSubHeading: SLIDER_DESC4),
  ];
}
