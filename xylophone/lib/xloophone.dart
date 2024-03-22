import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class XylophoneApp extends StatelessWidget {
  late AudioPlayer _audioPlayer;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildCell(Colors.red, 1),
              buildCell(Colors.black12, 2),
              buildCell(Colors.amber, 3),
              buildCell(Colors.yellow, 4),
              buildCell(Colors.purple, 5),
              buildCell(Colors.green, 6),
              buildCell(Colors.blue, 7),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCell(Color color, int i) {
    return TextButton(
        onPressed: () => {playSound(i)},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),
                    side: BorderSide(color: color))
            )),
        child: Text("$i"));
  }

  void playSound(int i) {
    // AudioCache cache = AudioCache();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setAsset('assets/note$i.wav');
    _audioPlayer.play();
  }
}