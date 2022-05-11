import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 250,
            child: Text(("data" * 500)),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text(("*" * 50)),
          ),
          Container(
              child: Text('a' * 1),
              constraints: const BoxConstraints(
                  maxWidth: 150, minWidth: 100, maxHeight: 100),
              padding: const EdgeInsets.all(10),
              //height: 50, Container responsive zaten
              margin: const EdgeInsets.all(10),
              decoration: ProjectContainerDecoration.projectBoxDecoration)
        ],
      ),
    );
  }
}

class ProjectContainerDecoration extends BoxDecoration {
  static BoxDecoration projectBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      //shape: BoxShape.circle,
      gradient:
          const LinearGradient(colors: [Colors.deepPurple, Colors.white10]),
      boxShadow: const [
        BoxShadow(color: Colors.purple, offset: Offset(0.1, 1), blurRadius: 12)
      ],
      border: Border.all(width: 10, color: Colors.white70));
}

class ProjectContainerDecorationImportantUsing extends BoxDecoration {
  ProjectContainerDecorationImportantUsing()
      : super(
            borderRadius: BorderRadius.circular(10),
            //shape: BoxShape.circle,
            gradient: const LinearGradient(
                colors: [Colors.deepPurple, Colors.white10]),
            boxShadow: const [
              BoxShadow(
                  color: Colors.purple, offset: Offset(0.1, 1), blurRadius: 12)
            ],
            border: Border.all(width: 10, color: Colors.white70));
}
