import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyColloectionsDemo extends StatefulWidget {
  const MyColloectionsDemo({Key? key}) : super(key: key);

  @override
  State<MyColloectionsDemo> createState() => _MyColloectionsDemoState();
}

class _MyColloectionsDemoState extends State<MyColloectionsDemo> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionsItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: const Icon(Icons.chevron_left_outlined),
          title: const Text("My Collections"),
          actions: [IconButton(icon: const Icon(Icons.menu), onPressed: () {})],
        ),
        body: ListView.builder(
          padding: PaddingUtility().paddingSymmetric,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return _CategoryCard(model: _items[index]);
          },
        ));
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  //final List<CollectionModel> _items;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: SizedBox(
          height: 300,
          child: Padding(
            padding: PaddingUtility().paddingGeneral,
            child: Column(
              children: [
                Expanded(child: Image.asset(_model.imagePath)),
                Padding(
                  padding: PaddingUtility().paddingTop,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_model.titleText),
                      Text('${_model.price} eth')
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String titleText;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.titleText, required this.price});
}

class PaddingUtility {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingSymmetric = const EdgeInsets.symmetric(horizontal: 20);
  final paddingGeneral = const EdgeInsets.all(20);
}

class CollectionsItems {
  late final List<CollectionModel> items;

  CollectionsItems() {
    items = [
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          titleText: 'Dash1',
          price: 3.1),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          titleText: 'Dash2',
          price: 3.2),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          titleText: 'Dash3',
          price: 3.3),
    ];
  }
}

class ProjectImages {
  static const imageCollection = 'assets/png/image_collection.png';
}
