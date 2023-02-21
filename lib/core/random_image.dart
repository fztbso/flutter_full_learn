import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({Key? key, this.height = 100}) : super(key: key);

  final imageUrl = "https://picsum.photos/200/200";
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, height: 100, fit: BoxFit.cover,);
  }
}
