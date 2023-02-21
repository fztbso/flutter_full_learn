import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/counter_hello_button.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;

  int _counterCustom = 0;

/*
  void incrementValue() {
    setState(() {
      _countValue += 1;
    });
  }

  void deincrementValue() {
    setState(() {
      _countValue -= 1;
    });
  }
  */


  void updateCounter(bool isIncrement) {
    if(isIncrement){
      _countValue += 1;
    } else {
      _countValue -= 1;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems.welcomeTitle),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      body: Column(
        children: [
          Center(child: Text(_countValue.toString(),
          style: Theme.of(context).textTheme.headline2,
          )),
          Placeholder(),
          CounterHelloButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
          onPressed: () {
            updateCounter(true);
          },
          child: Icon(Icons.add),
        );
  }

  Padding _deincrementButton() {
    return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: FloatingActionButton(
            onPressed: () {
              updateCounter(false);
            },
            child: Icon(Icons.remove),
          ),
        );
  }
}
