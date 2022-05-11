import 'package:flutter/material.dart';

class TextViewLearn extends StatelessWidget {
  TextViewLearn({Key? key}) : super(key: key);

  final String userName = 'New User';
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(('There is a magic ' * 10),
                //'Welcome $userName ${userName.length}',
                maxLines: 2,
                textAlign: TextAlign.left,

                ///for ...
                overflow: TextOverflow.ellipsis,
                style: ProjectStyles.welcomeTextStyle),
            Text(('There is a magic ' * 10),
                //'Welcome $userName ${userName.length}',
                maxLines: 2,
                textAlign: TextAlign.left,

                ///for ...
                overflow: TextOverflow.ellipsis,
                style: ProjectStyles.welcomeTextStyle),
            Text('Welcome $userName ${userName.length}',
                maxLines: 2,
                textAlign: TextAlign.left,

                ///for ...
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: ProjectColors.newUserColor)),
            //const SizedBox(height: 8.0),
            const SizedBox.shrink(),
            Text(keys.welcomeText)
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeTextStyle = const TextStyle(
      wordSpacing: 2,
      color: Colors.purple,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      letterSpacing: 2,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomeColor = Colors.purple;
  static Color newUserColor = Colors.lime;
}

class ProjectKeys {
  final String welcomeText = "WELCOME!";
}
