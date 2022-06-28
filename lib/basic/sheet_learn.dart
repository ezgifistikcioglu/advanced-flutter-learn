import 'package:flutter/material.dart';
import 'package:flutter_full/basic/image_learn.dart';
import 'package:flutter_full/basic/list_view_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: _backgroundColor,
        body: Center(
            child: TextButton(
                onPressed: () {
                  showCustomSheet(context, ListViewLearn());
                },
                child: const Text('Show'))),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                isScrollControlled: true, //bütün ekranı kaplar
                builder: (context) {
                  return const _ShowCustomSheet();
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
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Divider(
                color: Colors.black26,
                thickness: 3,
                indent: MediaQuery.of(context).size.width * 0.45,
                endIndent: MediaQuery.of(context).size.width * 0.45,
              ),
              Positioned(
                right: MediaQuery.of(context).size.width * 0.03,
                top: 0,
                height: MediaQuery.of(context).size.height * 0.01,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: PaddingManager.paddingLowAll,
                      child: Icon(Icons.close_rounded),
                    )),
              )
            ],
          ),
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
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        // isScrollControlled: true, //bütün ekranı kaplar
        builder: (context) {
          return _CustomMainSheet(child: child);
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [const _BaseSheetHeader(), Expanded(child: child)],
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    Key? key,
  })  : _gripHeight = 30,
        super(key: key);

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.01,
              top: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: PaddingManager.paddingLowAll,
                  child: Icon(Icons.close_rounded),
                ),
              ))
        ],
      ),
    );
  }
}

class PaddingManager {
  static const paddingLowAll = EdgeInsets.all(8.0);
}
