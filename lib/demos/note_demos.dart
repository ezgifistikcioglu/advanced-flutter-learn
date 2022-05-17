import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full/basic/image_learn.dart';

class NoteDemo extends StatelessWidget {
  const NoteDemo({Key? key}) : super(key: key);
  final String _title = 'Create your first note';
  final String _subTitle = 'Add a note ';
  final String _buttonText = 'Create a Note ';
  final String _buttonText2 = 'Import Notes ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().catMarieImageName),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTitleWidget(text: _subTitle * 10),
            ),
            const Spacer(),
            _createElevatedButton(context),
            TextButton(onPressed: () {}, child: Text(_buttonText2)),
            const SizedBox(height: ButtonHeights.buttonNormalHeight)
          ],
        ),
      ),
    );
  }

  ElevatedButton _createElevatedButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: SizedBox(
          height: ButtonHeights.buttonNormalHeight,
          child: Center(
              child: Text(
            _buttonText,
            style: Theme.of(context).textTheme.headline5,
          )),
        ));
  }
}

/// Center text widget
class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget(
      {Key? key, this.textAlign = TextAlign.center, required this.text})
      : super(key: key);
  final TextAlign? textAlign;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Colors.black38, fontWeight: FontWeight.w500));
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
}

class ButtonHeights {
  static const double buttonNormalHeight = 50;
}
