import 'package:flutter_full/advance_mid/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(
    () {},
  );
  test('User calculate Test', () {
    final users = [
      GenericUser('name1', '11', 10),
      GenericUser('name2', '22', 20),
      GenericUser('name3', '33', 30),
    ];

    final userManagement = UserManagement(AdminUser('boss', '1', 15, 1));

    final result = userManagement.calculateMoney(users);

    final res = userManagement.showNames<String>(users);

    expect(result, 75);
  });
}
