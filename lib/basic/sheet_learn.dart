import 'package:flutter/material.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: _backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                barrierColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                isScrollControlled: true, //bütün ekranı kaplar
                builder: (context) {
                  return _ShowCustomSheet();
                });

            if (result is bool) {
              setState(() {
                _backgroundColor = Colors.cyan;
              });
            }
          },
          child: const Icon(Icons.share_outlined),
        ));
  }
}

class _ShowCustomSheet extends StatefulWidget {
  const _ShowCustomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<_ShowCustomSheet> createState() => _ShowCustomSheetState();
}

class _ShowCustomSheetState extends State<_ShowCustomSheet> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('data2'),
            Image.network('https://picsum.photos/200', height: 200),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _backgroundColor = Colors.yellow;
                  });
                  Navigator.of(context).pop<bool>(true);
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }
}
