class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);
  void sayName(GenericUser user){
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users){
    int sum = 0;
    for (var item in users){
      sum += item.money as int;
    }

    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney = users.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => previousValue + element);

    final _money = users.fold<int>(initialValue, (previousValue, element) => previousValue +  element.money);
    return _money;
  }

  Iterable<T>? showNames(List<GenericUser> users){

    if(T is String){
      final names = users.map((e) => e.name);
      return names.cast<T>();
    }

    return null;
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);

}