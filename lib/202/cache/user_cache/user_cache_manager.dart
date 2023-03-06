import 'dart:convert';

import 'package:flutter_full_learn/202/cache/shared_manager.dart';

import '../shared_preferences_cache.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  void saveItems(List<User> items){
    // Compute
    final _items = items.map((element) => jsonEncode(element)).toList();
    sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems(){
    // Compute
    final itemsString = sharedManager.getStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element){
        final jsonObject = jsonDecode(element);
        return User("name", "description", "b");
      });
    }
    return null;
  }

}