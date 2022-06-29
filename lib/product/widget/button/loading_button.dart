import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton(
      {Key? key, required this.title, required this.onPressedCallback})
      : super(key: key);
  final String title;
  final Future<void> Function() onPressedCallback;
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Theme.of(context).textTheme.headline3!.fontSize ?? 50,
      child: ElevatedButton(
        onPressed: () async {
          if (_isLoading) {
            return;
          }
          _changeLoading();
          await widget.onPressedCallback.call();
          _changeLoading();
        },
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : Text(widget.title),
        ),
      ),
    );
  }
}
