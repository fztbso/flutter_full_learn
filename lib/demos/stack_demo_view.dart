import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);

  final _cardHeight = 50.0;
  final _cardWidth = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(flex: 4 ,child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(child: RandomImage(), bottom: _cardHeight/2,),
              Positioned(
                  width: _cardWidth,
                  bottom: 0,
                  height: _cardHeight,
                  child: _cardCustom()),
            ],
          )),
          Spacer(flex: 6,)
        ],
      ),
    );
  }
}

class _cardCustom extends StatelessWidget {
  const _cardCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              );
  }
}
