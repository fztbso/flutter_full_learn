import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Bekir", style: TextStyle(wordSpacing: 2, letterSpacing: 2),)),
    );
  }
  
}