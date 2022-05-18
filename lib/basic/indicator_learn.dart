import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: const [CenterCircularRedProgressIndicator()],
      ),
      body: Column(
        children: const [
          Center(child: CircularProgressIndicator()),
          SizedBox(height: 150),
          Center(child: LinearProgressIndicator())
        ],
      ),
    );
  }
}

/// İlla özel bir renk vereceksen böyle verirsin, ama bütün progressIndicator'ların aynı olsun diyorsan main'den Material içinde vermen yeterli.
class CenterCircularRedProgressIndicator extends StatelessWidget {
  const CenterCircularRedProgressIndicator({
    Key? key,
  }) : super(key: key);
  final Color redColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: redColor,
      strokeWidth: 10,
      value: 0.9,
      backgroundColor: Colors.white,
    ));
  }
}
