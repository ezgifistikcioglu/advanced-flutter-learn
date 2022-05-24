import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final _key = GlobalKey();
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 20,
            buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return _normalContainer(currentLength);
            },
            keyboardType: TextInputType.emailAddress,
            focusNode: focusNodeTextFieldOne,
            autofillHints: const [AutofillHints.email],
            inputFormatters: [TextProjectInputFormater()._formatter],
            textInputAction: TextInputAction.next,
            decoration: _InputDecorator().emailInput,
          ),
          TextFormField(
            focusNode: focusNodeTextFieldTwo,
            minLines: 2,
            maxLines: 4,
          )
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      key: _key,
      duration: const Duration(seconds: 1),
      width: 10.0 * (currentLength ?? 0),
      height: 10,
      //child: Colors.green,
    );
  }

  Container _normalContainer(int? currentLength) {
    return Container(
      height: 10,
      width: 40,
      color: Colors.green[100 * ((currentLength ?? 0) ~/ 2)],
    );
  }
}

class TextProjectInputFormater {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "a") {
      return oldValue;
    } else {
      return newValue;
    }
  });
}

class _InputDecorator {
  final emailInput = const InputDecoration(
      prefixIcon: Icon(Icons.mail),
      border: OutlineInputBorder(),
      labelText: LanguageItems.mailTitle);
}
