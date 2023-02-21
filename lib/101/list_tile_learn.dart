import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  final imageUrl = "https://picsum.photos/200/200";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: RandomImage(),
              // dense: true, sıkıştırıyor küçültüyor
              // minVerticalPadding: 0,
              onTap: () {},
              subtitle: Text("How do you use your card"),
              leading: Icon(Icons.money),
              trailing: Icon(Icons.chevron_right),
              // contentPadding: EdgeInsets.zero,

            ),
          )
        ],
      ),
    );
  }
}
