import 'package:emarket/screens/emarket_main.dart';
import 'package:flutter/material.dart';

class EmarketApp extends StatelessWidget {
  const EmarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Emarket",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          secondaryHeaderColor: Colors.blue.shade900),
      home: const EmarketMain(),
    );
  }
}
