

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_preferences_cache.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';

import '../view/reqres_view.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqResView> with ProjectDioMixin {

  List<Data> resources = [];
  late final IReqresService reqresService;
  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }



}

