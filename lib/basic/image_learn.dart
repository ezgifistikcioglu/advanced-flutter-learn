import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);
  final String _imagePath =
      "https://listimg.pinclipart.com/picdir/s/181-1813249_marie-greeting-a-butterfly-marie-cat-disney-world.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: SizedBox(
                width: 200,
                height: 250,
                child: PngImage(name: ImageItems().catMarieImageName)),
          ),
          SizedBox(
            width: 200,
            height: 250,
            child: Image.network(
              _imagePath,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.animation),
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class ImageItems {
  final String catImage = "assets/hd-cat-and-city-view-hjivvyh9tpglc9er.jpg";
  final String catMarieImage = "assets/png/ic_cat_marie.png";
  final String catMarieImageName = "ic_cat_marie";
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
    );
  }

  String get _nameWithPath => 'assets/png/$name.png';
}
