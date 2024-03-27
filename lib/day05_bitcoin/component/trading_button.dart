import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TradingButton extends StatelessWidget {
  late String baseType;
  late String quote;
  late String quoteType;

  TradingButton({required this.baseType,
    required this.quote, required this.quoteType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $baseType = $quote $quoteType',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}