import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/product/extension/string_extension.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';
import 'package:provider/provider.dart';
import '../model/resource_model.dart';

import '../viewModel/reqres_view_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({Key? key}) : super(key: key);

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

  // class _ReqResViewState extends ReqresViewModel {
  class _ReqResViewState extends State<ReqResView> with ProjectDioMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child){
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
            title: context.watch<ReqResProvider>().isLoading ?
            CircularProgressIndicator(color: Colors.white,) : null,
            actions: [
              ElevatedButton(onPressed: (){
                context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>());
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ImageLearn202()));
                },
                  child: Icon(Icons.ac_unit)),
            ],
          ),
          body: Column(
            children: [
              Selector<ReqResProvider, bool>(builder: (context, value, child){
                return value ? Placeholder() : Text("data");
              }, selector: (context, provider){
                return provider.isLoading;
              }),
              Expanded(child: _resourcesListview(context, context.watch<ReqResProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourcesListview(BuildContext context, List<Data> items) {
    return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                  color: Color(items[index].color?.colorValue ?? 0),
                  child: Text(items[index].name ?? "")
              );
            }
        );
  }
}
