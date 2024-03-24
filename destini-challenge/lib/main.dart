import 'package:destini_challenge_starting/mini_calculator.dart';
import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: MiniCalculator(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("黑暗小说"),),
      floatingActionButton: Theme(
        data: ThemeData.light(),
        child: FloatingActionButton(onPressed: () {  },
        child: Icon(Icons.add),),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage('images/background.png'))),
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      //Choice 1 made by user.
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    style: getCustomStyle(Colors.red),
                    child: Text(
                      storyBrain.getChoice1(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                (!storyBrain.buttonShouldBeVisible()) ? Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        //Choice 2 made by user.
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: getCustomStyle(Colors.blue),
                      child: Text(
                        storyBrain.getChoice2(),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ): Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle getCustomStyle(Color curColor) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(curColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),
    side: BorderSide(color: curColor))));
  }
}
