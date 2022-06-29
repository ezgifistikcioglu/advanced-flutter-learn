import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full/product/extension/string_extension.dart';

import '../viewModel/reqrest_view_model.dart';

class ReqrestView extends StatefulWidget {
  const ReqrestView({Key? key}) : super(key: key);

  @override
  State<ReqrestView> createState() => _ReqrestViewState();
}

class _ReqrestViewState extends ReqrestViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: isLoading ? const CircularProgressIndicator() : null),
      body: ListView.builder(
          itemCount: resources.length,
          itemBuilder: (BuildContext context, int index) {
            //inspect(resources[index].colorValue);
            return Card(
                color: Color(resources[index].color?.colorValue ?? 0),
                child: Text(resources[index].name ?? ''));
          }),
    );
  }
}
