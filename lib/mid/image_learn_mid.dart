import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../product/global/resource_context.dart';

class ImageLearnMid extends StatefulWidget {
  const ImageLearnMid({Key? key}) : super(key: key);

  @override
  State<ImageLearnMid> createState() => _ImageLearnMidState();
}

class _ImageLearnMidState extends State<ImageLearnMid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<ResourceContext>().clear();
              },
              icon: const Icon(Icons.remove))
        ],
        title: Text(
            context.read<ResourceContext>().model?.data?.length.toString() ??
                ''),
      ),
      body: ImagePaths.ic_cat_marie.toWidget(),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  ic_cat_marie
}

extension ImagePathsExtension on ImagePaths {
  String pathImage() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height = 94}) {
    return Image.asset(pathImage(), height: height);
  }
}
