import 'package:xylophone/model/question.dart';

class QuizzBrain {
  final List<Question> _questionList = [];
  late int _questionNum = 0;

  int getQuestionCount() => _questionList.length;

  int getCurIndex() {
    return _questionNum;
  }

  void nextQuestion() {
    _questionNum = (_questionNum + 1) % _questionList.length;
  }

  void init() {
    _questionList.addAll([
      Question("1+1 = 3，正确吗？", false),
      Question("1+2 = 3，正确吗？", true),
      Question("1+3 = 3，正确吗？", false),
      Question("1+4 = 3，正确吗？", false),
      Question("1+5 = 3，正确吗？", false)
    ]);
  }

  bool getCurAnswer() {
    return _questionList[_questionNum].anser;
  }

  String getCurDescription() {
    return _questionList[_questionNum].questionDescription;
  }
}