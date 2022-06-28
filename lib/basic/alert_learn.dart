import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({Key? key}) : super(key: key);

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //_showAboutDialogSample(context);
          final response = await showDialog(
              context: context,
              //barrierDismissible: false, //alertten başka yere basamıyor
              builder: (context) {
                return _ImageZoomDialog();
              });
          //inspect(response);
        },
      ),
    );
  }

  void _showAboutDialogSample(BuildContext context) {
    return showAboutDialog(
        context: context,
        applicationName: 'Flutter Alert',
        children: [const Text('data')]);
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Version update!'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Update2')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'))
      ],
    );
  }
}

class AlertKeys {
  static const versionUpdate = 'Version update!';
  static const textUpdate = 'Update';
  static const closeText = 'Close';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(AlertKeys.versionUpdate),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(AlertKeys.textUpdate)),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(AlertKeys.closeText))
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);
  final String _url = 'https://picsum.photos/200';

  ///InteractiveViewer: resimi kullanının zoom yapmasına imkan verecek şekle getirir
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.45,
        ),
      ),
    );
  }
}
