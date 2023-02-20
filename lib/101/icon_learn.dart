import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);

  final IconSizes iconSize = IconSizes();
  final IconColors iconColor = IconColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello")),
      body: Column(
        children: [
          IconButton(
              onPressed:() {},
              icon: Icon(
                Icons.accessible_rounded,
                color: Theme.of(context).backgroundColor,
                size: iconSize.iconSmall,)),
          IconButton(
              onPressed:() {},
              icon: Icon(
                Icons.accessible_rounded,
                color: iconColor.froly,
                size: iconSize.iconSmall2x,)),
        ],
      ),
    );
  }
}

class IconSizes {
  final double iconSmall = 40;
  final double iconSmall2x = 80;
}

class IconColors {
  final Color froly = Color(0xffED617A);
}