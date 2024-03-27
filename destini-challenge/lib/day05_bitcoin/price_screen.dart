import 'package:destini_challenge_starting/day05_bitcoin/component/trading_button.dart';
import 'package:destini_challenge_starting/day05_bitcoin/model/rate_changer.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'dart:math';

class PricePage extends StatefulWidget {
  static String path = 'price_page';

  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {

  late int selectIndex = 0;
  late List<String> curRates = ['?', '?', '?'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TradingButton(baseType: cryptoList[0], quote: curRates[0], quoteType: currenciesList[selectIndex]),
              TradingButton(baseType: cryptoList[1], quote: curRates[1], quoteType: currenciesList[selectIndex]),
              TradingButton(baseType: cryptoList[2], quote: curRates[2], quoteType: currenciesList[selectIndex]),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? getAndroidPicker(onItemChange)
                : getIosPicker(onItemChange),
          ),
        ],
      ),
    );
  }

  void onItemChange(String item) async {
    for (int i = 0; i < cryptoList.length; i++) {
      var rateData = await RateChange().getData(cryptoList[i], item);
      setState(() {
        if (rateData == null) {
          curRates[i] = '?';
          return;
        }
        double rate = rateData['rate'];
        curRates[i] = rate.toStringAsFixed(5);
      });
    }
  }

  Widget getAndroidPicker(Function onChange) {
    return DropdownButton<String>(
      value: currenciesList[selectIndex],
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white, fontSize: 25),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          selectIndex = currenciesList.indexOf(value!);
          onChange(value);
        });
      },
      items: currenciesList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget getIosPicker(Function onChange) {
    List<Widget> children = [];
    for (String item in currenciesList) {
      children.add(Text(item,
        style: TextStyle(color: Colors.amber),
      ));
    }

   return CupertinoPicker(
      itemExtent: 30,
      children: children,
      onSelectedItemChanged: (index) => {
        selectIndex = index,
        onItemChange(currenciesList[selectIndex])
      });
  }
}
