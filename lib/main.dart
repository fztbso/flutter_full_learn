import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/text_learn_view.dart';
import '101/app_bar_learn.dart';
import '101/button_learn.dart';
import '101/card_learn.dart';
import '101/color_learn.dart';
import '101/column_row_learn.dart';
import '101/container_sized_box_learn.dart';
import '101/custom_widget_learn.dart';
import '101/icon_learn.dart';
import '101/image_learn.dart';
import '101/indicator_learn.dart';
import '101/list_tile_learn.dart';
import '101/list_view_builder.dart';
import '101/list_view_learn.dart';
import '101/padding_learn.dart';
import '101/page_view_learn.dart';
import '101/scaffold_learn.dart';
import '101/stack_learn.dart';
import '101/statefull_learn.dart';
import '101/statefull_life_cycle_learn.dart';
import '101/stateless_learn.dart';
import '101/text_field_learn.dart';
import 'demos/color_demos_view.dart';
import 'demos/color_life_cycle_view.dart';
import 'demos/my_collections_demos.dart';
import 'demos/note_demos_view.dart';
import 'demos/stack_demo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          iconColor: Colors.redAccent,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600)
        ),
        listTileTheme: ListTileThemeData(
          // contentPadding: EdgeInsets.zero,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.white,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        errorColor: ColorItems.sulu,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light, //en üstteki saat wifi batarya işaret rengi
        )
      ),
      home: MyCollectionsDemos(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.money});

  final String title;
  final int money;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        actions: [Text(widget.money.toString())],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}
