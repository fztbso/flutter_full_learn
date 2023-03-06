import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {

  late final SharedManager _manager;
  late final List<User> userItems;

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
    userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
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
        actions: [_loading(context),
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
      body: Column(
        children: [
          TextField(
            onChanged: (value){
              _onChangeValue(value);
            },
          ),
          Expanded(
            child: _UserListView(),
          ),
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return _isLoading ?
        Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ) : SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: () async {
        changeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setInt('counter', _currentValue);
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: Icon(Icons.delete),
      onPressed: () async {
        changeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.remove('counter');
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
    );
  }
}

class _UserListView extends StatelessWidget {
   _UserListView({
    Key? key,
  }) : super(key: key);

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: ListTile(
              title: Text(users[index].name ?? ""),
              subtitle: Text(users[index].description ?? ""),
              trailing: Text(users[index].url ?? "", style: Theme.of(context).textTheme.subtitle1?.copyWith(
                decoration: TextDecoration.underline
              )),
            ),
          );
    });
  }
}


class UserItems {
  late final List<User> users;
  UserItems(){
    users = [
      User("bkr", "111", "mcbu.edu.tr"),
      User("kml", "222", "mcbu.edu.tr"),
      User("rana", "333", "mcbu.edu.tr"),
      User("elif", "444", "mcbu.edu.tr"),
    ];
  }
}


abstract class LoadingStatefull<T extends StatefulWidget> extends State<T>{
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}