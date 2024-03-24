import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/cell_icon_with_txt.dart';
import 'components/round_text_button.dart';
import 'const/constants.dart';
import 'components/reuse_cell_card.dart';
import 'components/submit_button.dart';

enum Gender {
  MALE,
  FEMALE;
}
const activeColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);


class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputPageState();
  }
}

class InputPageState extends State<InputPage> {
  late Gender selectGender = Gender.MALE;
  Color maleColor = inactiveCardColour;
  int height = 165;
  int weight = 80;
  int age = 18;

  void updateColor(Gender gender) {
      selectGender = gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Row(children: [
                        Expanded(child:
                        GestureDetector(
                          onTap: (){
                           setState(() {
                             updateColor(Gender.MALE);
                           }); 
                          },
                          child: ReusedCellCard(
                            onPress: ()=> { setState(() { selectGender = Gender.MALE; }) },
                            colour: selectGender == Gender.MALE ? activeColour : inactiveCardColour,
                            cellChild: CellWithIconText(icon: FontAwesomeIcons.mars, cellTitle: 'MALE')),
                        )),
                        Expanded(child:
                        ReusedCellCard(onPress: ()=> { setState(() { selectGender = Gender.FEMALE; }) },
                            colour: selectGender == Gender.FEMALE ? activeColour : inactiveCardColour,
                            cellChild: CellWithIconText(icon: FontAwesomeIcons.venus, cellTitle: 'FEMALE'))),
                      ])),
                  Expanded(
                      child: Container(
                        child: ReusedCellCard(colour: kActiveCardColour, cellChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('HEIGHT', style: kLabelTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(height.toString(), style: kNumberTextStyle,),
                                Text('cm', style: kLabelTextStyle,)
                              ],),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29EB1555),
                                thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                              ),
                              child: Slider(value: height.toDouble(),
                                  min: 120.0, max: 250.0, onChanged: (curValue) => {
                                    setState(() {
                                      height = curValue.toInt();
                                    })
                                  }),
                            )
                          ],
                        ), onPress: ()=>{}),
                      )),
                  Expanded(
                    child: Row(children: [
                      Expanded(child: ReusedCellCard(
                          onPress:()=> {}, colour: kActiveCardColour,
                          cellChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('HEIGHT', style: kLabelTextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(weight.toString(), style: kNumberTextStyle,),
                                  Text('kg', style: kLabelTextStyle,)
                                ],),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(onPressed: ()=>{setState(() {
                                  weight++;
                                  })},
                                  backgroundColor: maleColor,
                                  elevation: 8,
                                  shape: CircleBorder(),
                                  child: Icon(FontAwesomeIcons.minus, color: Colors.white,),
                                  ),
                                  // FloatingActionButton(onPressed: ()=>{},
                                  //   backgroundColor: maleColor,
                                  //   shape: CircleBorder(),
                                  //   child: Icon(FontAwesomeIcons.plus, color: Colors.white,),
                                  // ),
                                  RoundTextButton(onPress: ()=>{
                                    setState(() {
                                      weight++;
                                    })
                                  }, icon: FontAwesomeIcons.plus, fillColor: maleColor, elevation: 8)
                                ],
                              )
                            ],
                          ))),
                      Expanded(child: ReusedCellCard(
                          onPress:()=> {}, colour: kActiveCardColour,
                          cellChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE', style: kLabelTextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(age.toString(), style: kNumberTextStyle,),
                                  Text('', style: kLabelTextStyle,)
                                ],),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(onPressed: ()=>{setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  })},
                                    backgroundColor: maleColor,
                                    elevation: 8,
                                    shape: CircleBorder(),
                                    child: Icon(FontAwesomeIcons.minus, color: Colors.white,),
                                  ),
                                  // FloatingActionButton(onPressed: ()=>{},
                                  //   backgroundColor: maleColor,
                                  //   shape: CircleBorder(),
                                  //   child: Icon(FontAwesomeIcons.plus, color: Colors.white,),
                                  // ),
                                  RoundTextButton(onPress: ()=>{
                                    setState(() {
                                      if (age < 120) {
                                        age++;
                                      }
                                    })
                                  }, icon: FontAwesomeIcons.plus, fillColor: maleColor, elevation: 8)
                                ],
                              )
                            ],
                          ))),
                    ])),
                  SubmitButton(onPressed: () => {}, txt: 'submit')
                ])));
  }
}


