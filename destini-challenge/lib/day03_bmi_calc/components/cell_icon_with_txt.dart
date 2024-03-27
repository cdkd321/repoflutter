import 'package:flutter/material.dart';

import '../const/constants.dart';

class CellWithIconText extends StatelessWidget {

  final IconData icon;
  final String? cellTitle;

  const CellWithIconText({super.key, required this.icon, this.cellTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        SizedBox(height: 15.0),
        Text(cellTitle!, style: kLabelTextStyle)
      ],);
  }
}