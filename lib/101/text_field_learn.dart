import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            style: TextStyle(color: Colors.deepOrange),
            maxLength: 20,
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            textInputAction: TextInputAction.next,
            inputFormatters: [TextProjectInputFormatter()._formatter],
            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return Container(
                height: 10,
                width: 50,
                color: Colors.green[100 * (currentLength ?? 0)],
              );
            },
            decoration: _InputDecorator().emailInput,
          ),
          TextField(
            style: TextStyle(color: Colors.deepOrange),
            maxLength: 20,
            keyboardType: TextInputType.phone,
            autofillHints: [AutofillHints.email],
            inputFormatters: [TextProjectInputFormatter()._formatter],
            decoration: _InputDecorator().phoneInput,
          ),
        ],
      ),
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
  if (oldValue.text == "a"){
  return newValue;
  }
  return oldValue;
  });
}

class _InputDecorator {
  final emailInput = InputDecoration(

    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
    labelText: LanguageItems.mailTitle,
    filled: true,
    fillColor: Colors.white,
  );

  final phoneInput = InputDecoration(

    prefixIcon: Icon(Icons.phone_iphone_outlined),
    border: OutlineInputBorder(),
    labelText: LanguageItems.phoneTitle,
    filled: true,
    fillColor: Colors.white,
  );
}