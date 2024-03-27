import 'package:flutter/material.dart';

class RoundTextButton extends StatelessWidget {
  final Function onPress;
  final Color? fillColor;
  final int? elevation;
  final IconData? icon;

  RoundTextButton({required this.onPress, required this.icon, required this.fillColor, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: () { onPress(); },
      fillColor: fillColor,
      elevation: 8,
      shape: CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon, color: Colors.white,),
    );
  }
}