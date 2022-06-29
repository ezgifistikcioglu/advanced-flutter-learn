import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full/advance_mid/reqrest_resource/service/reqrest_service.dart';
import 'package:flutter_full/advance_mid/reqrest_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full/product/extension/string_extension.dart';
import 'package:flutter_full/product/service/project_dio.dart';
import 'package:provider/provider.dart';

import '../viewModel/reqrest_view_model.dart';

class ReqrestView extends StatefulWidget {
  const ReqrestView({Key? key}) : super(key: key);

  @override
  State<ReqrestView> createState() => _ReqrestViewState();
}

//class _ReqrestViewState extends ReqrestViewModel
class _ReqrestViewState extends State<ReqrestView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      builder: (context, child) {
        return Scaffold(
            // appBar: AppBar(
            //     title: isLoading ? const CircularProgressIndicator() : null),
            // body: ListView.builder(
            //     itemCount: resources.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       //inspect(resources[index].colorValue);
            //       return Card(
            //           color: Color(resources[index].color?.colorValue ?? 0),
            //           child: Text(resources[index].name ?? ''));
            //     }),
            );
      },
      create: (context) => ReqresProvider(ReqrestService(service)),
    );
  }
}
