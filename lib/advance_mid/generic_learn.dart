class UserManagement {
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;

    for (var item in users) {
      sum += item.money;
    }

    final sumMoney = users
        .map((e) => e.money)
        .fold<int>(0, (previousValue, element) => previousValue + element);

    final _money = users.fold<int>(
        0, (previousValue, element) => previousValue + element.money);

    return _money;
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}
