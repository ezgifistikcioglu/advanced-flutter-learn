import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              color: Colors.blue,
              height: 100,
            ),
          ),
          Positioned(
            // left: 0,
            // right: 0,
            height: 40,
            bottom: 0,
            width: 25,
            //top: 100,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Positioned.fill(
            top: 100,
            child: Container(
              color: Colors.purple,
            ),
          )
        ],
      ),
    );
  }
}
