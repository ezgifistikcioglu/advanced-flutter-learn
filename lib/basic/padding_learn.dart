import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding().pagePaddingVertical,
        //const EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(color: Colors.purple, height: 100)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
                padding: EdgeInsets.zero, color: Colors.purple, height: 100),
          ),
          Padding(
            padding: ProjectPadding().pagePaddingRight +
                ProjectPadding()
                    .pagePaddingVertical, // 10 + 10 = 20 vertical değer oldu nice bilgi tut
            child: const Text("gfg"),
          )
        ]),
      ),
    );
  }
}

class ProjectPadding {
  final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 10);
  final pagePaddingRight = const EdgeInsets.only(right: 20);
}
