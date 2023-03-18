

import 'package:flutter/material.dart';

import '../../../product/global/resource_context.dart';
import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService reqresService;

  List<Data> resources = [];

  bool isLoading = false;

  void _changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this.reqresService){
    _fetch();
  }


  Future<void> _fetch() async {
    _changeLoading();
    resources = await fetchItems();
    _changeLoading();
  }

  Future<List<Data>> fetchItems() async {
    return (await reqresService.fetchResourceItem())?.data ?? [];
  }

  void saveToLocale(ResourceContext resourceContext, List list){
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
