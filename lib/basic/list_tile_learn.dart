import 'package:flutter/material.dart';
import 'package:flutter_full/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);
  final String _titleText = "My Card";
  final String _subTitleText = "How do you use your card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        ListTile(
          title: Text(_titleText),
          onTap: () {},
          subtitle: Text(_subTitleText),
          leading: const Icon(Icons.money),
          trailing: const Icon(Icons.chevron_right_outlined),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const RandomImage(),
              contentPadding: EdgeInsets.zero,

              /// dense: componenti olabildiğince sıkıştırmayı sağlayarak kendi paddinglerini siliyor
              dense: true,
              onTap: () {},
              subtitle: Text(_subTitleText),
              leading: const Icon(Icons.money),
              trailing:
                  const SizedBox(child: Icon(Icons.chevron_right_outlined)),
            ),
          ),
        ),
      ]),
    );
  }
}
