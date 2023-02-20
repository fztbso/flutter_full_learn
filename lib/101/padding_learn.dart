import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20) + EdgeInsets.symmetric(vertical: 10),
            child: Container(color: Colors.white, height: 100,),
          ),
          Padding(
            padding: ProjectPadding.pagePaddingRightOnly + ProjectPadding.pagePaddingVertical,
            child: Container(color: Colors.white, height: 100,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(color: Colors.white, height: 100,),
          ),
          Text("Bekir"),
        ],
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddingVertical = const EdgeInsets.symmetric(vertical: 10);
  static const pagePaddingRightOnly = const EdgeInsets.only(right: 20);
}