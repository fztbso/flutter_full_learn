import 'package:flutter/material.dart';

class ImageGenericPickerView extends StatefulWidget {
  const ImageGenericPickerView({Key? key}) : super(key: key);

  @override
  State<ImageGenericPickerView> createState() => _ImageGenericPickerViewState();
}

class _ImageGenericPickerViewState extends State<ImageGenericPickerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("Fetch from gallery")),
          ElevatedButton(onPressed: (){}, child: Text("Fetch from normal")),
          ElevatedButton(onPressed: (){}, child: Text("Fetch from multiple")),
        ],
      ),
    );
  }
}
