import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.cyan)),
                  Expanded(child: Container(color: Colors.purple)),
                  Expanded(child: Container(color: Colors.green)),
                  Expanded(child: Container(color: Colors.yellow)),
                ],
              )),
          const Spacer(flex: 2),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("data"),
                  Text("data2"),
                  Text("data3"),
                ],
              )),
          SizedBox(
            height: ProjectContainerSized.cardHeight,
            child: Column(children: const [
              Expanded(child: Text("data")),
              Expanded(child: Text("data")),
              Expanded(child: Text("data")),
              Spacer(),
              Expanded(child: Text("data")),
            ]),
          )
        ],
      ),
    );
  }
}

class ProjectContainerSized {
  static const double cardHeight = 200;
}
