import 'package:flutter/material.dart';

class NavigateHomeDetail extends StatefulWidget {
  const NavigateHomeDetail({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  State<NavigateHomeDetail> createState() => _NavigateHomeDetailState();
}

class _NavigateHomeDetailState extends State<NavigateHomeDetail> {
  String? _id;

  @override
  void initState() {
    super.initState();
    _id = widget.id ?? "";
    Future.microtask(() {
      final _modelId = ModalRoute.of(context)?.settings.arguments;
      setState(() {
        _id = _modelId is String ? _modelId : widget.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id ?? ""),
      ),
    );
  }
}
