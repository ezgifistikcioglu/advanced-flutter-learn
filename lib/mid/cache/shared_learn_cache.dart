import 'package:flutter/material.dart';
import 'package:flutter_full/mid/cache/shared_manager.dart';
import 'package:flutter_full/mid/cache/user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _sharedManager;
  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _sharedManager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangedValue(_sharedManager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangedValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [_loadingIndicator(context)],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_saveValueButton(), _removeValueButton()],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangedValue(value);
            },
          ),
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loadingIndicator(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
        : const SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: () async {
        changeLoading();
        // Obtain shared preferences.
        //final prefs = await SharedPreferences.getInstance();
        //await prefs.setInt('counter', _currentValue);
        await _sharedManager.saveString(
            SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        changeLoading();
        // Obtain shared preferences.
        //final prefs = await SharedPreferences.getInstance();
        //await prefs.remove('counter');
        await _sharedManager.removeItem(SharedKeys.counter);
        changeLoading();
      },
    );
  }
}

//dummy data using
class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('flutter1', '101', 'pub.dev'),
      User('flutter2', '102', 'pub.dev'),
      User('flutter3', '103', 'pub.dev'),
    ];
  }
}

// Generic - BaseView Kullanımı
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
