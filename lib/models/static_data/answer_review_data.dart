import 'package:gsscomplete/models/static_data/question_data.dart';

class AnswerReview {
  final String question;
  final String correctAnswer;
  final String wrongAnswer;

  AnswerReview(
      {required this.question,
      required this.correctAnswer,
      required this.wrongAnswer});
}
