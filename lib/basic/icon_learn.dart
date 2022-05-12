import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);
  final String _title = 'Welcome Icon Learn';
  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: iconColors.froly,
              size: iconSizes.smallIcon, //IconSizes().smallIcon,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: Theme.of(context)
                  .colorScheme
                  .error, // bu kullanım tema rengi değiştiğinde(dark-white) generic olarak uyum sağlıyor o yüzden sağlıklı kullanım budur!!
              size: iconSizes.smallIcon, //IconSizes().smallIcon,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: iconColors.froly,
              size: IconSizes.smallIcon2x, //IconSizes().smallIcon,
            )),
      ]),
    );
  }
}

class IconSizes {
  final double smallIcon = 40;
  static const double smallIcon2x = 80;
}

class IconColors {
  final Color froly = const Color(0xffED617A);
}
