import 'package:flutter/material.dart';
import 'package:flutter_full/product/language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({Key? key}) : super(key: key);

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCustom = 0;
  final String _helloText = LanguageItems.welcomeTitle;
  void _updateCounter() {
    setState(() => ++_counterCustom);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => _updateCounter,
        child: Text("$_helloText $_counterCustom"));
  }
}
