import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  const ColorLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(
        //color: Theme.of(context).errorColor,
        child: Text("Bekir", style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).errorColor),),
      ),
    );
  }
}

class ColorItems {
  static Color porsche = Color(0xffEDBF61);
  static Color sulu = Color.fromRGBO(198, 237, 97, 1);
}