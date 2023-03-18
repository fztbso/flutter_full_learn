

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/303/testable/user_save_model.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
@GenerateMocks([ReqResProvider])
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{'bekir': "kamile"};
    SharedPreferences.setMockInitialValues(values);
  });
  test("saveToLocale - Test", () {
    var mockProvider = ReqResProvider(ReqresService(Dio()));
    final resourceContext = ResourceContext();
    final result = mockProvider.saveToLocale(resourceContext, []);

    // expect(result, []);
  });

  test("saveToLocale - Test", () async {
    var userViewModel = UserSaveViewModel();
    final result = userViewModel.getReadData("bekir",MockStore());

    expect(result, false);
  });
}