import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({Key? key, required this.message})
      : super(key: key);
  final String message;

  @override
  State<StatefullLifeCycleLearn> createState() =>
      _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;

  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _isOddOrEven();
    //print('a');
  }

  @override
  void didChangeDependencies() {
    // Genelde kendi widget'ı içinde kullanılır.
    super.didChangeDependencies();
    //print('b');
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    // Daha detaylı araştır önemli burası.
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != _message) {
      _message = widget.message;
      _isOddOrEven();
      setState(() {
        //  print("c");
      });
    }
  }

  @override
  void dispose() {
    // sayfa bitti başka sayfaya geçtik o zaman çalışır.
    super.dispose();
    _message = '';
  }

  void _isOddOrEven() {
    _isOdd ? _message += ' Çift' : _message += ' Tek';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
