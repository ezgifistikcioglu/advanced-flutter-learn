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

    final result = UserManagement().calculateMoney(users);

    expect(result, 60);
  });
}
