import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_conversion/app/controllers/home_controller.dart';
import 'package:money_conversion/app/models/currency_model.dart';

main() {
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();
  final homeController =
      HomeController(toText: toText, fromText: fromText, currencies: []);

  test('Must convert real to dollar with dot.', () {
    fromText.text = '2.0';
    homeController.convert();
    expect(toText.text, '0.36');
  });

  test('Must convert real to dollar with comma.', () {
    fromText.text = '2,0';
    homeController.convert();
    expect(toText.text, '0.36');
  });

  test('Must convert dollar to real with comma.', () {
    fromText.text = '1,0';
    homeController.fromCurrency = CurrencyModel(
        name: 'Dolar', real: 5.65, dolar: 1.00, euro: 0.85, bitcoin: 0.000088);
    homeController.toCurrency = CurrencyModel(
        name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    homeController.convert();
    expect(toText.text, '5.65');
  });
}
