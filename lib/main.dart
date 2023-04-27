import 'package:flutter/material.dart';
import 'package:moneyconv/pages/mainpage.dart';

void main() {
  runApp(const MoneyConv());
}

class MoneyConv extends StatelessWidget {
  const MoneyConv({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MoneyConv',
      home: mainpage(),
    );
  } 
}
