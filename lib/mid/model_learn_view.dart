import 'package:flutter/material.dart';

import 'model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  PostModel8 user9 = PostModel8(body: 'a');

  @override
  void initState() {
    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..body = 'ef';
    user1.body = 'hello';

    final user2 = PostModel2(1, 2, 'b', 'a');
    user2.body = 'a';

    final user3 = PostModel3(1, 2, 'a', 'b');
    // user3.body = 'a'; => final old. için kullanamayız

    final user4 = PostModel4(userId: 1, id: 2, body: 'a', title: 'b');
    // user4.body = 'a'; => final old. için kullanamayız
    final user5 = PostModel5(userId: 1, id: 2, body: 'a', title: 'b');
    user5.userId;

    final user6 = PostModel6(userId: 1, id: 2, body: 'a', title: 'b');
    final user7 = PostModel7();

    //service kullanıyorsak en mantıklı yöntem
    final user8 = PostModel8(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //user9 = PostModel8(title: 'On pressed');
            user9 = user9.copyWith(title: 'On pressed');
            user9.updateBody("New data");
            user9.updateBody(null);
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.body ?? 'Not has any data'),
      ),
    );
  }
}
