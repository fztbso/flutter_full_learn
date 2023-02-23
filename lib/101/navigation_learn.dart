import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key,}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index){
        return TextButton(
          onPressed: () async {
            final response = await navigateToWidgetNormal<bool>(context, NavigateDetailLearnDart(
              isOkey: selectedItems.contains(index),
            ));

            if (response is bool) {
              addSelected(index, response);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Placeholder(
              color: selectedItems.contains(index) ? Colors.greenAccent : Colors.redAccent,),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigation_rounded),
        onPressed: () {

        },
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget)  {
        Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        settings: RouteSettings(),
        builder: (context) => widget));
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget)  {
        return Navigator.of(context).push<T>(MaterialPageRoute(
        fullscreenDialog: true,
        settings: RouteSettings(),
        builder: (context) => widget));
  }
}

