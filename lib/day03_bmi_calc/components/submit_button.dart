import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? txt;
  SubmitButton({required this.onPressed, this.txt});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: getCustomStyle(Colors.red),
      child: Text(txt!,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }

  ButtonStyle getCustomStyle(Color curColor) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(curColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: curColor))));
  }

}