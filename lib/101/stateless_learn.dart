import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          /*
          Text(
            "elif",
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            "elif",
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            "elif",
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            "elif",
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            "elif",
            style: Theme.of(context).textTheme.headline3,
          ),
           */
          TitleTextWidget(text: "Elif"),
          _emptyBox(),
          TitleTextWidget(text: "Rana"),
          _emptyBox(),
          TitleTextWidget(text: "Bekir"),
          _emptyBox(),
          TitleTextWidget(text: "Kamile"),
          _emptyBox(),
          _CustomContainer(),
          _emptyBox(),
        ],
      ),
    );
  }

  SizedBox _emptyBox() {
    return SizedBox(
          height: 10,
        );
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.redAccent,
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key,required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
