import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/question.dart';

class Quizzler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizzlerState();
  }
}

class QuizzlerState extends State<Quizzler> {
  final List<Question> questionList = [];
  late int questionNum = 0;
  List<FinalResult> resultList = [];

  @override
  void initState() {
    initQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        home: Scaffold(
            body: SafeArea(
                child: Column(
          children: [
            Expanded(flex: 5,
                child: Center(child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(questionList[questionNum].questionDescription)),)),
            Column(children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    QuestionButton(() => onHit(true), 'True', Colors.red),
                    QuestionButton(()=> onHit(false), 'False', Colors.green),
                  ]),
                ),
            ],),
            generResult(resultList)
          ],
        ))));
  }

  void initQuestions() {
    questionList.addAll([
      Question("1+1 = 3，正确吗？", false),
      Question("1+2 = 3，正确吗？", true),
      Question("1+3 = 3，正确吗？", false),
      Question("1+4 = 3，正确吗？", false),
      Question("1+5 = 3，正确吗？", false)
    ]);
  }

  void onHit(bool result) {
    setState(() {
      if (questionNum == 0) {
        resultList.clear();
      }
      if (questionList[questionNum].anser == result) {
        resultList.add(FinalResult(true, Icons.check));
      } else {
        resultList.add(FinalResult(false, Icons.close_rounded));
      }
      questionNum = (questionNum + 1) % questionList.length;
      print("questionNum:$questionNum");
    });
  }

  Widget generResult(List<FinalResult> resultList) {
    return Expanded(
        child: resultList.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Icon(resultList[index].resultIcon, color: resultList[index].result? Colors.white: Colors.red),
                itemCount: resultList.length)
            : Text('empty'));
  }
}

class QuestionButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final String title;
  final Color? color;
  QuestionButton(this.onPressed, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          child: Text(title, style: TextStyle(color: Colors.white)),
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(color!),
              shape:
              MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: color!))))),
    );
  }
}

class FinalResult {
  late bool result;
  late IconData resultIcon;

  FinalResult(this.result, this.resultIcon);
}
