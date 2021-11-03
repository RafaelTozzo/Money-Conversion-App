import 'package:flutter/material.dart';
import 'package:money_conversion/app/models/currency_model.dart';

class HomeController {
  List<CurrencyModel> currencies;

  final TextEditingController fromText;
  final TextEditingController toText;

  late CurrencyModel fromCurrency;
  late CurrencyModel toCurrency;

  HomeController({required this.currencies, required this.fromText, required this.toText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    if (toCurrency.name == 'Real') {
      returnValue = value * fromCurrency.real;
    } else if (toCurrency.name == 'Dolar') {
      returnValue = value * fromCurrency.dolar;
    } else if (toCurrency.name == 'Euro') {
      returnValue = value * fromCurrency.euro;
    } else if (toCurrency.name == 'BitCoin') {
      returnValue = value * fromCurrency.bitcoin;
    }

    toText.text = returnValue.toStringAsFixed(2);
  }
}
