import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full/basic/app_bar_learn.dart';
import 'package:flutter_full/basic/container_sized_box_learn.dart';
import 'package:flutter_full/basic/icon_learn.dart';
import 'package:flutter_full/basic/scaffold_learn.dart';
import 'package:flutter_full/basic/text_view_learn.dart';

import 'basic/button_learn.dart';
import 'basic/color_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          errorColor: ColorItems.sulu,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor:
                Colors.transparent, //transparan olması için elevation 0 şart
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle
                .light, // Android cihazın şarz ve saat bilgilerinin old kısım, önemli
          )),
      home: const ColorLearn(),
    );
  }
}
