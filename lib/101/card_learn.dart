import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomCard( child: Center(child: Text("Bekir", style: TextStyle(color: Theme.of(context).colorScheme.error,))),),
          Card(
            color: Theme.of(context).colorScheme.error,
            child: SizedBox(height: 100, width: 200,),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          CustomCard(child: SizedBox(height: 100, width: 200,),),
          SizedBox(
            width: 200,
            height: 100,
            child: Card(
              color: Theme.of(context).colorScheme.onSecondary,
              child: Center(child: Text("Bekir - Kamile")),
            ),
          ),
      ],
    ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key, required this.child
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      color: Colors.white,
      child: SizedBox(height: 100, width: 300,
      child: Center(child: Text("Bekir", style: TextStyle(color: Theme.of(context).colorScheme.error,))),
      ),
      shape: StadiumBorder(),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}