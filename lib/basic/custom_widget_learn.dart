import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({Key? key}) : super(key: key);
  final String title = "Food";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomFootButton(
                onPressed: () {},
                title: title,
              ),
            ),
          )),
          const SizedBox(height: 100),
          CustomFootButton(onPressed: () {}, title: title),
        ],
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  static const EdgeInsets normalPadding = EdgeInsets.all(8.0);
  static const EdgeInsets normal2xPadding = EdgeInsets.all(16.0);
}

class CustomFootButton extends StatelessWidget with _ColorsUtility {
  CustomFootButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _PaddingUtility.normal2xPadding,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: redColor, shape: const StadiumBorder()),
          onPressed: onPressed,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
          )),
    );
  }
}
