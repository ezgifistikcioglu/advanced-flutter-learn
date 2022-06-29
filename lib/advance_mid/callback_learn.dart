import 'package:flutter/material.dart';
import 'package:flutter_full/product/widget/button/loading_button.dart';
import 'package:flutter_full/product/widget/callback_dropdown.dart';

import '../product/widget/button/answer_button.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallbackDropdown(onUserSelected: (CallbackUser user) {
            print(user);
          }),
          AnswerButton(
            onNumber: (number) {
              return number % 3 == 1;
            },
          ),
          LoadingButton(
              title: 'Save',
              onPressedCallback: () async {
                await Future.delayed(const Duration(seconds: 1));
              })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

// TODO: Dummy Romove it
  /// Dummy usage stage1
  static List<CallbackUser> dummyUsers() {
    return [CallbackUser('somebody', 123), CallbackUser('somebody2', 102)];
  }

  ///Generate equality deriz çünkü listenin elemanlarını eşit sanıp aynı referansı gösteriyor
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}

/// Dummy usage stage2
class CallbackUsers {
  late final List<CallbackUser> users;

  CallbackUsers() {
    users = [
      CallbackUser('somebody1', 101),
      CallbackUser('somebody2', 102),
    ];
  }
}
