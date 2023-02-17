import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 250,
            height: 200,
            child: Text("AaA"*300),
          ),
          SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text("b"*50),
          ),
          Container(
            width: 50,
            height: 50,
            constraints: BoxConstraints(
                maxWidth: 500,
                minWidth: 200,
            ),
            child: Text("aa"*100),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.red,
              // shape: BoxShape.circle,
              border: Border.all(width: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
