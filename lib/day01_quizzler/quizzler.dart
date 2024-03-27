import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'model/question.dart';
import 'model/quizz_brain.dart';

class QuizzlerPage extends StatefulWidget {
  static String path = 'quizzler';
  @override
  State<StatefulWidget> createState() {
    return QuizzlerPageState();
  }
}

class QuizzlerPageState extends State<QuizzlerPage> {

  List<FinalResult> resultList = [];
  QuizzBrain brain = QuizzBrain();

  @override
  void initState() {
    initQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('小测验'),),
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(brain.getCurDescription(), style: TextStyle(fontSize: 30),)),
          )),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  QuestionButton(
                      () => onHit(true, context), 'True', Colors.red),
                  QuestionButton(
                      () => onHit(false, context), 'False', Colors.green),
                ]),
            ),
          ],
        ),
        generResult(resultList)
      ],
    )));
  }

  void initQuestions() {
    brain.init();
  }

  void onHit(bool result, BuildContext context) {
    if (brain.getCurIndex() == 0) {
      resultList.clear();
    }
    setState(() {
      if (brain.getCurAnswer() == result) {
        resultList.add(FinalResult(true, Icons.check));
      } else {
        resultList.add(FinalResult(false, Icons.close_rounded));
      }

      print("questionNum:${brain.getCurIndex()}");
      brain.nextQuestion();
    });

    if (brain.getCurIndex() == 0) {
      _onCustomAnimationAlertPressed(context);
    }
  }

  _onCustomAnimationAlertPressed(context) {
    final Alert alert = Alert(
        context: context,
        title: "tips",
        desc: "题目已经全部回答完毕，重新作答吗？",
        alertAnimation: fadeAlertAnimation,
        onWillPopActive: true,
        buttons: [
          DialogButton(child: Text('Yes'), color: Colors.green, onPressed: () => nextStep(context),),
          DialogButton(child: Text('No'), onPressed: () => nextStep(context))
        ]);
    alert.show();
  }

  Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  Widget generResult(List<FinalResult> resultList) {
    return Expanded(
        child: resultList.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Icon(
                    resultList[index].resultIcon,
                    color:
                        resultList[index].result ? Colors.white : Colors.red),
                itemCount: resultList.length)
            : Text(''));
  }

  void nextStep(BuildContext context) {
    Navigator.pop(context);
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
              backgroundColor: MaterialStateProperty.all<Color>(color!),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
