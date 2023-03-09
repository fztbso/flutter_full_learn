import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ""),
      ),
      body: ImagePaths.ic_apple_with_books.toWidget(height: 1111),
    );
  }
}

enum ImagePaths {
  ic_apple_with_books
}

extension ImagePathsExtension on ImagePaths {
  String path() {
    return "assets/jpeg/$name.jpeg";
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(path(), height: height,);
  }
}