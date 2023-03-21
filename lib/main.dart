
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/text_learn_view.dart';
import 'package:flutter_full_learn/202/service/comment_learn_view.dart';
import 'package:flutter_full_learn/202/theme/light_theme.dart';
import 'package:flutter_full_learn/202/theme_learn_view.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_view.dart';
import 'package:flutter_full_learn/303/tabbar_advance.dart';
import 'package:flutter_full_learn/product/constant/project_items.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/navigator/navigator_custom.dart';
import 'package:flutter_full_learn/product/navigator/navigator_manager.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';
import 'package:provider/provider.dart';
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
import '101/navigation_learn.dart';
import '101/padding_learn.dart';
import '101/page_view_learn.dart';
import '101/scaffold_learn.dart';
import '101/stack_learn.dart';
import '101/statefull_learn.dart';
import '101/statefull_life_cycle_learn.dart';
import '101/stateless_learn.dart';
import '101/text_field_learn.dart';
import '202/alert_learn.dart';
import '202/animated_learn_view.dart';
import '202/cache/secure_context/secure_context_learn.dart';
import '202/cache/shared_preferences_cache.dart';
import '202/form_learn_view.dart';
import '202/image_learn_202.dart';
import '202/model_learn_view.dart';
import '202/oop_learn_view.dart';
import '202/package_learn_view.dart';
import '202/service/service_learn_get_view.dart';
import '202/service/service_post_learn_view.dart';
import '202/shared_list_cache.dart';
import '202/sheet_learn.dart';
import '202/tab_learn.dart';
import '202/widget_size_enum_learn_view.dart';
import '303/call_back_learn.dart';
import '303/feed_view.dart';
import '303/lottie_learn.dart';
import '303/mobx_image_picker/view/mobx_image_upload_view.dart';
import '303/package/kartal/kartal_view.dart';
import '303/reqres_resource/view/reqres_view.dart';
import '404/bloc/feature/login/view/login_view.dart';
import '404/compute/compute_learn.dart';
import 'demos/color_demos_view.dart';
import 'demos/color_life_cycle_view.dart';
import 'demos/my_collections_demos.dart';
import 'demos/note_demos_view.dart';
import 'demos/stack_demo_view.dart';

void main() {

  runApp(MultiProvider(providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
  ],

  builder: (context, child) => MyApp(),

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projectNames,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,

      builder: (context, child){
        return MediaQuery(data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1
        ), child: child ?? SizedBox());
      },

      /* ThemeData.dark().copyWith(

        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.amber,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey,
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
        ),
      ),
       */
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context){
          return LottieLearn();
        });
      },
      // routes: NavigatorRoutes().items,
      onGenerateRoute: NavigatorCustom().onGenerateRoute,
      navigatorKey: NavigatorManagerr.instance.navigatorGlobalKey,
      home: ComputeLearnView(),
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
