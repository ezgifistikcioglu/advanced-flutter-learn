import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum _SecureKeys { token }

class SecureContextLearn extends StatefulWidget {
  const SecureContextLearn({Key? key}) : super(key: key);

  @override
  State<SecureContextLearn> createState() => _SecureContextLearnState();
}

class _SecureContextLearnState extends State<SecureContextLearn> {
  final _storage = const FlutterSecureStorage();
  String _title = '';
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
    if (_title.isNotEmpty) {
      print("This user has used this app before.");
      _controller.text = _title;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _storage.write(key: _SecureKeys.token.name, value: _title);
          },
          label: const Text('Save')),
      body: TextField(
        controller: _controller,
        onChanged: saveItems,
        minLines: 3,
        maxLines: 4,
      ),
    );
  }
}
