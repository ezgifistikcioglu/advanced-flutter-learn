import 'package:flutter/material.dart';

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
      appBar: AppBar(),
    );
  }
}
