import 'package:flutter/material.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({Key? key}) : super(key: key);
  final String _title = 'Welcome Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left_outlined),
        automaticallyImplyLeading: false, //back butonu otomatik gelmesin demek
        leadingWidth: 23, //soldaki iconu daha öne alıyor belki lazım olur
        actionsIconTheme: const IconThemeData(color: Colors.red),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_open_rounded),
          ),
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
      body: Column(children: const []),
    );
  }
}
