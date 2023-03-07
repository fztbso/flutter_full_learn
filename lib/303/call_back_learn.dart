import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/widget/button/answer_button.dart';
import 'package:flutter_full_learn/product/widget/button/loading_button.dart';
import 'package:flutter_full_learn/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropdown(onUserSelected: (CallbackUser user){
            print(user);
          }),
          AnswerButton(onNumber: (number){
            return number %3 ==1;
          }),
          LoadingButton(title: "Save", callback: () async {
            await Future.delayed(Duration(seconds: 1));
          })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

  // TODO: Dummy Remove it
  static List<CallbackUser> dummyUsers(){
    return [
      CallbackUser("vb", 123),
      CallbackUser("vb2", 1234),
    ];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CallbackUser &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              id == other.id;
}
