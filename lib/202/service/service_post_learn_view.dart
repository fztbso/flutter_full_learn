import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _networkManager;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _networkManager.post('posts', data: postModel);
    if(response.statusCode == HttpStatus.created){
      name = "Başarılı";
    }
    _changeLoading();
  }


  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name ?? ""),
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
        ],),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText:  "Title"
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextField(
              controller: _bodyController,
              decoration: InputDecoration(
                labelText:  "Body"
            ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                labelText:  "UserId"
            ),
            // autofillHints:[AutofillHints.creditCardNumber, AutofillHints.creditCardExpirationYear],
            // inputFormatters: [ ],
          ),
          TextButton(onPressed: _isLoading ? null
              : () {
            if(_titleController.text.isNotEmpty && _userIdController.text.isNotEmpty
            &&_bodyController.text.isNotEmpty ){
              final model = PostModel(
                  body: _bodyController.text,
                  title: _titleController.text,
                  userId: int.tryParse(_userIdController.text));
              _addItemToService(model);
            }

          }, child: Text("Send")),
        ],
      ),
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
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
