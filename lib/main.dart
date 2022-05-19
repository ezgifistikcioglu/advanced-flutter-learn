import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full/basic/page_view_learn.dart';
import 'package:flutter_full/basic/stateful_learn.dart';

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
          listTileTheme:
              const ListTileThemeData(contentPadding: EdgeInsets.zero),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.purple),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          errorColor: ColorItems.sulu,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor:
                Colors.transparent, //transparan olması için elevation 0 şart
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle
                .light, // Android cihazın şarz ve saat bilgilerinin old kısım, önemli
          )),
      home: const PageViewLearn(),
    );
  }
}
