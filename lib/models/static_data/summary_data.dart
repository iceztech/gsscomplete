import 'package:gsscomplete/utils/constants/general_constants.dart';

class SummaryData {
  final String summaryHeading;
  final String summarySubHeading;
  final String summaryChapterAuthor;
  final String summaryBody;

  SummaryData(
      {required this.summaryHeading,
      required this.summarySubHeading,
      required this.summaryChapterAuthor,
      required this.summaryBody});

  static List<SummaryData> summaryArrayList = [
    SummaryData(
        summaryHeading: HEADER_ONE,
        summarySubHeading: SUB_HEADER_ONE,
        summaryChapterAuthor: AUTHOR_HEADER_ONE,
        summaryBody: BODY_HEADER_ONE),
    SummaryData(
        summaryHeading: HEADER_TWO,
        summarySubHeading: SUB_HEADER_TWO,
        summaryChapterAuthor: AUTHOR_HEADER_TWO,
        summaryBody: BODY_HEADER_TWO),
    SummaryData(
        summaryHeading: HEADER_THREE,
        summarySubHeading: SUB_HEADER_THREE,
        summaryChapterAuthor: AUTHOR_HEADER_THREE,
        summaryBody: BODY_HEADER_THREE),
    SummaryData(
        summaryHeading: HEADER_FOUR,
        summarySubHeading: SUB_HEADER_FOUR,
        summaryChapterAuthor: AUTHOR_HEADER_FOUR,
        summaryBody: BODY_HEADER_FOUR),
  ];
}
