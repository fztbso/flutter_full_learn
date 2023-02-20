import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Image.asset("assets/jpeg/ic_apple_with_books.jpeg")),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://picsum.photos/200", errorBuilder: (context, error, stackTree) => Icon(Icons.accessible_rounded),),
          ),
        ],
      ),
    );
  }
}

class ImageItems {
  final String appleWithBook = "assets/jpeg/ic_apple_with_books.jpeg";

}

class JpegImage extends StatelessWidget {
  const JpegImage({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/jpeg/ic_apple_with_books.jpeg", fit: BoxFit.fill,);
  }
}


