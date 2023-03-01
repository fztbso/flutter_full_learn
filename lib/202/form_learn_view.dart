import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {

  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              validator: (value){
                return (value?.isNotEmpty ?? false) ? null : "Bu alan boş geçilemez!";
              },
            ),
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            DropdownButtonFormField(items: [
              DropdownMenuItem(child: Text("bekir"), value: 1,),
              DropdownMenuItem(child: Text("kamile"), value: 2,),
              DropdownMenuItem(child: Text("rana"), value: 3,),
              DropdownMenuItem(child: Text("elif"), value: 4,),
            ], onChanged: (value){}),
            ElevatedButton(onPressed: () {
              if (_key.currentState?.validate() ?? false) {
                print("okey");
              }
            }, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}


class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = "Boş geçilemez";
}