import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full/mid/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _networkManagerDio;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIDController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _networkManagerDio = Dio(BaseOptions(baseUrl: _baseUrl));
    name = "unKnown";
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    changeLoading();
    final response = await _networkManagerDio.post('posts', data: postModel);
    if (response.statusCode == HttpStatus.created) {
      name = 'Success';
    }
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next),
          _smallSizedBoxHeight(context),
          TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next),
          _smallSizedBoxHeight(context),
          TextField(
              controller: _userIDController,
              keyboardType: TextInputType.number,
              autofillHints: const [AutofillHints.creditCardNumber],
              decoration: const InputDecoration(labelText: 'UserId')),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIDController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIDController.text));
                        _addItemToService(model);
                      }
                    },
              child: const Text("Send"))
        ],
      ),
    );
  }

  SizedBox _smallSizedBoxHeight(BuildContext context) =>
      SizedBox(height: _smallSizedBox(context));

  double _smallSizedBox(BuildContext context) =>
      MediaQuery.of(context).size.height * .02;
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
