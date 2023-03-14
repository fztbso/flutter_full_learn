import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({Key? key}) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        child: Icon(Icons.abc_rounded),
          onPressed: (){
          Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf, arguments: "abc");
          }
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
