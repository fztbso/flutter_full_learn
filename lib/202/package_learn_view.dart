import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/packages/launch_mixin.dart';
import 'package:flutter_full_learn/202/packages/loading_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin, LaunchMixin{

  final Uri url = Uri.parse('https://mcbu.edu.tr');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: (){
        launchUrl(url);
      },),
      body: Column(
        children: [
          Text("a", style: Theme.of(context).textTheme.subtitle1,),
          LoadingBar(),
        ],
      ),
    );
  }
}
