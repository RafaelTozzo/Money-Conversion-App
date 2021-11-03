import 'package:flutter/material.dart';
import 'package:money_conversion/app/components/currency_button_component.dart';
import 'package:money_conversion/app/controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController fromText = TextEditingController();

  final TextEditingController toText = TextEditingController();
  HomeController? homeController;

  @override
  void initState() {
    super.initState();
    homeController =
        HomeController(currencies: [], fromText: fromText, toText: toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 30, left: 30, right: 20),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 230,
              height: 230,
            ),
            CurrencyDropButton(
              selectedItem: homeController!.fromCurrency,
              controller: fromText,
              items: homeController!.currencies,
              onChanged: (model) {
                setState(() {
                  homeController!.fromCurrency = model!;
                });
              },
            ),
            SizedBox(height: 15),
            CurrencyDropButton(
              selectedItem: homeController!.toCurrency,
              controller: toText,
              items: homeController!.currencies,
              onChanged: (model) {
                setState(() {
                  homeController!.toCurrency = model!;
                });
              },
            ),
            SizedBox(height: 70),
            ElevatedButton(
              child: Text('CONVERSION'),
              onPressed: () {
                homeController!.convert();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
