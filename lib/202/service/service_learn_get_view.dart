import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comment_learn_view.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  String? name;
  bool _isLoading = false;
  late final Dio _networkManager;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  // TEST EDİLEBİLİR KOD BASLADI
  late final IPostService _postService;

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }


  Future<void> fetchPostItems() async {

    final response = await Dio().get("https://jsonplaceholder.typicode.com/posts");
    _changeLoading();
    if(response.statusCode == HttpStatus.ok){
      final _datas = response.data;

      if(_datas is List){
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }


  Future<void> fetchPostItemsAdvance() async {

    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }



  @override
  void initState() {
    name = "bekir";
    super.initState();
    fetchPostItemsAdvance();
    _postService = PostService();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name ?? ""),
      actions: [
        _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
      ],),
      body: _items == null ? Placeholder()
          : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
          itemCount: _items?.length ?? 0,
          itemBuilder: (context, index) {
        return _PostCard(model: _items?[index]);
      }),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  }) : _model = model, super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:  EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentLearnView(postId: _model?.id,)));
        },
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
