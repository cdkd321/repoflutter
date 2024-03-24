import 'package:flutter/material.dart';

class ReusedCellCard extends StatelessWidget {
  final Widget cellChild;
  final Color colour;
  final Function? onPress;

  ReusedCellCard({required this.cellChild, required this.colour, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> {onPress??onPress!()},
      child: Container(
        child: cellChild,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 8, top: 8, right: 8),
        padding: EdgeInsets.only(left: 8, right: 4),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
