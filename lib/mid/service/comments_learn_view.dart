import 'package:flutter/material.dart';
import 'package:flutter_full/mid/service/comment_model.dart';
import 'package:flutter_full/mid/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  final int? postId;
  const CommentsLearnView({Key? key, this.postId}) : super(key: key);

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  bool _isLoading = false;
  List<CommentModel>? _commentsItemList;
  late final IPostService postService;

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithId(int postId) async {
    _changeLoading();
    _commentsItemList =
        await postService.fetchRelatedCommentsWithPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentsItemList?.length ?? 0,
        itemBuilder: (context, index) {
          return Card(child: Text(_commentsItemList?[index].email ?? ''));
        },
      ),
    );
  }
}
