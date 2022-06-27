import 'dart:io' show Platform;

import 'package:bitcoin_ticker_flutter/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String coinValue = '?';
  Map<String, double> cryptoValues = {};
  CoinData coinData = CoinData();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
    getAnyCoinData(currency: selectedCurrency);
  }

  void getData() async {
    final rate = await coinData.getCoinData();
    setState(() {
      coinValue = rate.toStringAsFixed(1);
    });
  }

  void getAnyCurrencyData(String currency) async {
    final rate = await coinData.getAnyCurrencyData(currency);
    setState(() {
      coinValue = rate.toStringAsFixed(1);
    });
  }

  void getAnyCoinData({String currency}) async {
    final res = await coinData.getAnyCoinData(currency: currency);
    setState(() {
      cryptoValues = res;
    });
  }

  String selectedCurrency = 'USD';

  Widget getDropdownButton() {
    List<DropdownMenuItem> listOfItems = [];
    for (var i = 0; i < currenciesList.length; i++) {
      var newItem = DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      );
      listOfItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: listOfItems,
      onChanged: (String value) {
        setState(() {
          selectedCurrency = value;
        });
        getAnyCoinData(currency: selectedCurrency);
      },
    );
  }

  Widget getCupertinoPicker() {
    List<Text> listOfItems = [];
    for (var i = 0; i < currenciesList.length; i++) {
      var newItem = Text(currenciesList[i]);
      listOfItems.add(newItem);
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedId) {
        setState(() {
          selectedCurrency = currenciesList[selectedId];
        });
        getAnyCoinData(currency: selectedCurrency);
      },
      children: listOfItems,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return getCupertinoPicker();
    } else {
      return getDropdownButton();
    }
  }

  Widget buildCryptoCurrencyPriceCard({String cryptoName, double cryptoCoin}) {
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
            '1 $cryptoName = ${cryptoCoin.toStringAsFixed(1)} $selectedCurrency',
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

  List<Widget> getCryptoCards() {
    List<Widget> cards = [];
    for (String crypto in cryptoValues.keys) {
      cards.add(buildCryptoCurrencyPriceCard(
          cryptoName: crypto, cryptoCoin: cryptoValues[crypto]));
    }
    return cards;
  }

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
          ...getCryptoCards(),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: getPicker()),
        ],
      ),
    );
  }
}
