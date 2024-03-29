import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full/mid/service/comments_learn_view.dart';
import 'package:flutter_full/mid/service/post_model.dart';
import 'package:flutter_full/mid/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  String? name;
  bool _isLoading = false;
  late final Dio _networkManagerDio;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  //TEST EDİLEBİLİR KOD BAŞLADI
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _networkManagerDio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    name = "unKnown";
    fetchPostItemsAdvance();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    changeLoading();
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _myDatas = response.data;

      if (_myDatas is List) {
        setState(() {
          _items = _myDatas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
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
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              },
            ),
    );
  }
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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentsLearnView(postId: _model?.id),
          ));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
