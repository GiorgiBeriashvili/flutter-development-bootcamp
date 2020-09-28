import 'package:bitcoin_ticker/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

String apiKey;
const baseUrl = 'https://rest.coinapi.io/v1/exchangerate/';

class CoinData {
  static Future<Map<String, String>> fetchCoinRates(String currency) async {
    Map<String, String> fetchedCoinRates = {};

    apiKey = DotEnv().env['API_KEY'];

    for (String crypto in cryptoList) {
      var coinData =
          await NetworkClient.get('$baseUrl$crypto/$currency?apiKey=$apiKey');

      fetchedCoinRates[crypto] = coinData['rate'].toString().split('.').first;
    }

    return fetchedCoinRates;
  }
}
