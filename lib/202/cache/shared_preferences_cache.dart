import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends State<SharedLearn> {

  late final SharedManager _manager;

  int  _currentValue = 0;

  bool _isLoading = false;

  void _chanegeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if(_value != null){
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDefaultValues();
    _manager = SharedManager();
    _initialize();
  }

  Future<void> _initialize() async {
    _chanegeLoading();
    await _manager.init();
    _chanegeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [_isLoading ?
          Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ) : SizedBox.shrink(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: _removeValueButton(),
          ),
        ],
      ),
      body: TextField(
        onChanged: (value){
          _onChangeValue(value);
        },
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: () async {
        _chanegeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setInt('counter', _currentValue);
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        _chanegeLoading();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: Icon(Icons.delete),
      onPressed: () async {
        _chanegeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.remove('counter');
        await _manager.removeItem(SharedKeys.counter);
        _chanegeLoading();
      },
    );
  }
}

