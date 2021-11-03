import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app/views/home_view.dart';

main(List<String> args) {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
