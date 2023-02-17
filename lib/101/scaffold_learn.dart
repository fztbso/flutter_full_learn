import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/container_sized_box_learn.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scaffold Samples"),),
      backgroundColor: Colors.deepPurple,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(height: 200, color: Colors.orangeAccent,)
          );
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      drawer: Drawer(),
      //bottomSheet: Text("Bekir Sıtkı"),
      body: Text("Merhaba"),
      bottomNavigationBar: Container(
        height: 200,
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "1"),
            BottomNavigationBarItem(icon: Icon(Icons.access_alarm_rounded,), label: "2"),
          ],
        ),
      ),
    );
  }
}
