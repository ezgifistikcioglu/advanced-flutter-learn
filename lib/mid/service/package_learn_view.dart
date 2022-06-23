import 'package:flutter/material.dart';
import 'package:flutter_full/mid/package/launch_mixin.dart';
import 'package:flutter_full/mid/package/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin {
  final Uri uri = Uri.parse('https://flutter.dev');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            launchURL(uri);
          },
        ),
        body: const LoadingBar());
  }
}
