import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 4,
                child: Row(
                  children: [
                    Expanded(child: Container( color: Colors.redAccent,)),
                    Expanded(child: Container( color: Colors.greenAccent,)),
                    Expanded(child: Container( color: Colors.blue,)),
                    Expanded(child: Container( color: Colors.black,)),
              ],
            )),
            Spacer(flex: 3,),
            Expanded(flex: 2, child: Container( color: Colors.yellowAccent,)),
            Expanded(flex: 3, child: Container( color: Colors.blue,)),
            Expanded(flex: 4, child: Container( color: Colors.deepPurpleAccent,)),
            Expanded(flex: 5, child: Container( color: Colors.orangeAccent,)),
            Expanded(flex: 6, child: Container( color: Colors.grey,)),
          ],
        ),
      ),
    );
  }
}
