

import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'unknown_model.dart';

void main() {
  late final INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(
      options: BaseOptions(baseUrl: 'https://reqres.in/api'),
    );
  });
  test("Vexana test", () async {
    final response = await networkManager.send<unknownModel, unknownModel>("/unknown", parseModel: unknownModel(), method: RequestType.GET);
  });
}