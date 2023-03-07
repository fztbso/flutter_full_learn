import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({Key? key, required this.onNumber}) : super(key: key);
  final bool Function(int number) onNumber;
  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override

  Color? _backgroundColor;
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor
      ),
        onPressed: (){
     final result = Random().nextInt(10);

     final response = widget.onNumber.call(result);
     if(response) {
       setState(() {
         _backgroundColor = response ? Colors.greenAccent : Colors.redAccent;
       });
     }
    }, child: Text("aaa"));
  }
}
