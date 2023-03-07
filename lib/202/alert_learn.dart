import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({Key? key}) : super(key: key);

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         final response = await showDialog(
             // barrierDismissible: false, //tıklanmak zorunda bırakıyor çıkamıyosun
             context: context, builder: (context){
            return _ImageZoomDialog();
          });
         inspect(response);
        },
      ),
    );
  }
}

class _updateDialog extends StatelessWidget {
  const _updateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("version update!"),
      actions: [
        ElevatedButton(onPressed: () {
          Navigator.pop(context, true);
        }, child: Text("Update")),
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("Close"))
      ],
    );
  }
}

class Keys {
  static const versionUpdate = "version update!";
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(key: key,
  title: Text(Keys.versionUpdate),
  actions: [
  ElevatedButton(onPressed: () {
  Navigator.pop(context, true);
  }, child: Text("Update")),
  TextButton(onPressed: (){
  Navigator.of(context).pop();
  }, child: Text("Close"))
  ],
  );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({Key? key}) : super(key: key);
  final String _url = "https://picsum.photos/200";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(_url,
        fit: BoxFit.cover,
        height: 300,
        ),
      ),
    );
  }
}

