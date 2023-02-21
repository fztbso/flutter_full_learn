import 'package:flutter/material.dart';

class StateLearn extends StatelessWidget {
  const StateLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(color: Colors.red, height: 100,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(color: Colors.blue, height: 100,),
          ),

          Positioned(
            bottom: 0,
              height: 100,
              width: 50,
              child: Container(color: Colors.deepOrangeAccent,)
          ),
        ],
      ),
    );
  }
}
