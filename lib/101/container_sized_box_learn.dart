import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 250,
            height: 200,
            child: Text("AaA"*300),
          ),
          SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text("b"*50),
          ),
          Container(
            width: 50,
            height: 50,
            constraints: BoxConstraints(
                maxWidth: 500,
                minWidth: 200,
            ),
            child: Text("aa"*100),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(7),
            decoration: ProjectContainerDecoration(),
          ),
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    //color: Colors.red,
    gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [BoxShadow(color: Colors.lightGreenAccent, offset: Offset(0.1, 1), blurRadius: 12)],
    // shape: BoxShape.circle,
    border: Border.all(width: 10, color: Colors.white),
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration() : super(
    //color: Colors.red,
    gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [BoxShadow(color: Colors.lightGreenAccent, offset: Offset(0.1, 1), blurRadius: 12)],
    // shape: BoxShape.circle,
    border: Border.all(width: 10, color: Colors.white),);
}