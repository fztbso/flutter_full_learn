import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/password_textfield.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({Key? key}) : super(key: key);


  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PasswordTextField(),
          CheckboxListTile(value: true,
              title: Text("Select"),
              onChanged: (val){

          }),
        ],
      ),
    );
  }
}

