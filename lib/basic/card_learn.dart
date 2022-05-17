import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: ProjectMargins.cardMargin,
            color: Colors.purple,
            child: const SizedBox(
                height: 100, width: 200, child: Center(child: Text("Sample"))),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          Card(
            margin: ProjectMargins.cardMargin,
            color: Theme.of(context).colorScheme.error,
            child: const SizedBox(
                height: 100, width: 200, child: Center(child: Text("Sample"))),
          ),
          const _CustomCard(
              child: SizedBox(
                  height: 100,
                  width: 200,
                  child: Center(child: Text("Sample"))))
        ],
      ),
    );
  }
}

/// Border Kinds
/// * StadiumBorder(), * CircleBorder()
class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}

class _CustomCard extends StatelessWidget {
  final Widget child;
  // final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  //  shape main'e taşındı çünkü tüm card'lar aynı shape ile kullanılacak projede

  const _CustomCard({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      color: Theme.of(context).colorScheme.error,
      child: child,
      //shape: roundedRectangleBorder,
    );
  }
}
