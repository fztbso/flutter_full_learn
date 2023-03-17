import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({Key? key}) : super(key: key);

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _imageUploadLottiePath = "https://assets1.lottiefiles.com/packages/lf20_urbk83vw.json";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Lottie.network(_imageUploadLottiePath)),
          Divider(),
          Expanded(
            flex: 2,
            child: Card(
              elevation: 13,
              child: FittedBox(child: IconButton(onPressed: (){}, icon: Icon(Icons.upload_file_outlined)))
            ),
          ),
          Divider(),
          Spacer(flex: 6,),
        ],
      ),
    );
  }
}
