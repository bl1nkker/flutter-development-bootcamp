import 'package:bitcoin_ticker_flutter/services/networking.dart';

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '4ADE4C3F-9D81-4D03-B01D-B7677D07C19D';

class CoinData {
  //TODO: Create your getCoinData() method here.
  Future<double> getCoinData() async {
    NetworkHelper networkHelper =
        NetworkHelper(coinAPIURL + '/BTC/USD?apiKey=$apiKey');
    final response = await networkHelper.getCoinData();
    return response['rate'];
  }

  Future<double> getAnyCurrencyData(String currency) async {
    NetworkHelper networkHelper =
        NetworkHelper(coinAPIURL + '/BTC/$currency?apiKey=$apiKey');
    final response = await networkHelper.getCoinData();

    return response['rate'];
  }
}
