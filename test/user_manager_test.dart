

import 'dart:math';

import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test(";User calculate ", () {

    final users = [
      GenericUser("vb", "11", 10),
      GenericUser("vb", "11", 20),
      GenericUser("vb", "11", 30),
    ];

    final userManagement = UserManagement(AdminUser("badmin", "1", 15, 1));
    final result = userManagement.calculateMoney(users);
    userManagement.showNames(users);
    final response = userManagement.showNames(users);
    expect(result, 55);
  });
}