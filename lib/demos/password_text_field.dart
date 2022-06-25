import 'package:flutter/material.dart';

class PassWordTextFieldDemo extends StatefulWidget {
  const PassWordTextFieldDemo({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;

  @override
  State<PassWordTextFieldDemo> createState() => _PassWordTextFieldDemoState();
}

class _PassWordTextFieldDemoState extends State<PassWordTextFieldDemo> {
  final String _obsecureText = '#';
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure, // invisible yapar şifreyi
      obscuringCharacter: _obsecureText,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: 'Password',
        //suffixIcon: Text('a'),
        suffix: _onVisibilityIcon(),
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: () {
        _changeLoading();
      },
      icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          crossFadeState:
              _isSecure ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(seconds: 2)),
    );
    //icon: Icon(_isSecure ? Icons.visibility_off : Icons.visibility));
  }
}
