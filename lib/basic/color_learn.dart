import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          // Container(
          //  color: ColorItems.sulu,
          //  child: const Text("gghgjgjg"),
          //),
          Column(
        children: [
          Container(
            color: Theme.of(context).errorColor,
            child: const Text("Color learn"),
          )
        ],
      ),
    );
  }
}

class ColorItems {
  static const Color porchase = Color(0xffEDBF61);
  static const Color sulu = Color.fromARGB(198, 237, 97, 1);
}
