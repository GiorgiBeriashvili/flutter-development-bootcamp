import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String _selectedCurrency = 'USD';
  Map<String, String> _cryptoRates;

  @override
  void initState() {
    _updateUI();

    super.initState();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: coinTiles(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getCupertinoPicker() : getDropdownButton(),
          ),
        ],
      ),
    );
  }

  DropdownButton<String> getDropdownButton() {
    return DropdownButton<String>(
      value: _selectedCurrency,
      items: currenciesList
          .map((currency) =>
              DropdownMenuItem<String>(child: Text(currency), value: currency))
          .toList(),
      onChanged: (value) => setState(() {
        _selectedCurrency = value;

        _updateUI();
      }),
    );
  }

  CupertinoPicker getCupertinoPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (index) {
        _selectedCurrency = currenciesList[index];

        _updateUI();
      },
      children: currenciesList
          .map((currency) => Text(
                currency,
                style: TextStyle(color: Colors.white),
              ))
          .toList(),
    );
  }

  void _updateUI() async {
    var data = await CoinData.fetchCoinRates(_selectedCurrency);

    setState(() => _cryptoRates = data);
  }

  List<CoinTile> coinTiles() {
    if (_cryptoRates == null) {
      return cryptoList
          .map((element) => CoinTile(
                cryptoCurrency: element,
                rate: '?',
                selectedCurrency: _selectedCurrency,
              ))
          .toList();
    } else {
      return _cryptoRates.entries
          .map((entry) => CoinTile(
                cryptoCurrency: entry.key,
                rate: entry.value,
                selectedCurrency: _selectedCurrency,
              ))
          .toList();
    }
  }
}

class CoinTile extends StatelessWidget {
  final String cryptoCurrency;
  final String rate;
  final String selectedCurrency;

  CoinTile({this.cryptoCurrency, this.rate, this.selectedCurrency});

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
            '1 $cryptoCurrency = ${rate ?? '?'} $selectedCurrency',
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
