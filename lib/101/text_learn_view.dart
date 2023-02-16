import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
   TextLearnView({super.key,});
  final String name = "Bekir";
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome $name ${name.length}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis, //sonuna 3 nokta koymayı sağlıyor
            textAlign: TextAlign.right,
            style: TextStyle(wordSpacing: 2,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                color: Colors.red,
                letterSpacing: 2, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            "Welcome $name ${name.length}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis, //sonuna 3 nokta koymayı sağlıyor
            textAlign: TextAlign.right,
            style: ProjectStyles.welcomeStyle,
          ),
          Text(
            "Welcome $name ${name.length}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis, //sonuna 3 nokta koymayı sağlıyor
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline5?.copyWith(color: ProjectColors.welcomeColor),
          ),
          Text(keys.welcome),
        ],
      )),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = TextStyle(wordSpacing: 2,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: Colors.red,
      letterSpacing: 2, fontSize: 16, fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomeColor = Colors.yellow;
}

class ProjectKeys {
  final String welcome = "Merhaba";
}