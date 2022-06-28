import 'package:flutter/material.dart';
import 'package:flutter_full/basic/alert_learn.dart';
import 'package:flutter_full/basic/sheet_learn.dart';
import 'package:flutter_full/mid/cache/secure_context/secure_context_learn.dart';
import 'package:flutter_full/mid/cache/shared_list_cache.dart';
import 'package:flutter_full/mid/theme/light_theme.dart';

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
      theme: LightTheme().theme,
      //ThemeData.dark().copyWith(
      //    bottomAppBarTheme:
      //        const BottomAppBarTheme(shape: CircularNotchedRectangle()),
      //    tabBarTheme: const TabBarTheme(
      //        labelColor: Colors.amber,
      //        unselectedLabelColor: Colors.white,
      //        indicatorSize: TabBarIndicatorSize.label),
      //    listTileTheme:
      //        const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //    progressIndicatorTheme:
      //        const ProgressIndicatorThemeData(color: Colors.purple),
      //    textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white)),
      //    inputDecorationTheme: const InputDecorationTheme(
      //        filled: true,
      //        fillColor: Colors.transparent,
      //        iconColor: Colors.purple,
      //        border: OutlineInputBorder()),
      //    cardTheme: CardTheme(
      //        shape: RoundedRectangleBorder(
      //            borderRadius: BorderRadius.circular(20))),
      //    errorColor: ColorItems.sulu,
      //    appBarTheme: const AppBarTheme(
      //      centerTitle: true,
      //      backgroundColor:
      //          Colors.transparent, //transparan olması için elevation 0 şart
      //      elevation: 0,
      //      systemOverlayStyle: SystemUiOverlayStyle
      //          .light, // Android cihazın şarz ve saat bilgilerinin old kısım, önemli
      //    )),
      home: const AlertLearn(),
    );
  }
}
