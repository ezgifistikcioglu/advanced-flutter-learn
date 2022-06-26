import 'package:flutter/material.dart';
import 'package:flutter_full/mid/oop_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({Key? key}) : super(key: key);

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {
  FileDownload? fileDownload;

  @override
  void initState() {
    super.initState();
    fileDownload = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fileDownload?.downloadItem(null);
        },
      ),
    );
  }
}
