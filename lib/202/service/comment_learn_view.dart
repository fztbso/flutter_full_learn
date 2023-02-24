import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

import 'comment_model.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({Key? key,  this.postId}) : super(key: key);
  final int? postId;

  @override
  State<CommentLearnView> createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {

  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentsItem;


  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithId(int postId) async {
    _changeLoading();
      _commentsItem =await postService.fetchPRelatedCommentsWithPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _commentsItem?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Text(_commentsItem?[index].email ?? ""),
            );
          },
      ),
    );
  }
}
