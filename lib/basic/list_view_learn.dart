import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // FittedBox kendini ekrana göre ayarlar, size ile uğraşmaya gerek kalmaz otomatik size diyebiliriz,
                // hiçbir style vermeye gerek yok olduğu yere sıkışmasını sağlar
                FittedBox(
                  child: Text(
                    "Hello",
                    style: Theme.of(context).textTheme.headline2,
                    maxLines: 1,
                  ),
                ),
                Container(color: Colors.red, height: 300),
                const Divider(),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(color: Colors.green, width: 100),
                      Container(color: Colors.white, width: 100),
                      Container(color: Colors.green, width: 100),
                      Container(color: Colors.white, width: 100),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.close))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
