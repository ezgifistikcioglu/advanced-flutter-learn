import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          print('touch');
        },
        child: Column(
          children: [
            textFormFieldValidator(),
            textFormFieldValidator(),
            DropdownButtonFormField<String>(
                validator: FormFieldValidator().isNotEmpty,
                items: const [
                  DropdownMenuItem(child: Text('data'), value: 'v'),
                  DropdownMenuItem(child: Text('data2'), value: 'v2'),
                  DropdownMenuItem(child: Text('data3'), value: 'v3'),
                ],
                onChanged: (value) {}),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print('ok');
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }

  TextFormField textFormFieldValidator() =>
      TextFormField(validator: FormFieldValidator().isNotEmpty);
}

class FormFieldValidator {
  //  ((value) {
  //   return (value?.isNotEmpty ?? false)
  //       ? null
  //       : 'This field cannot be left blank';
  // }),
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'This field cannot be left blank';
}
