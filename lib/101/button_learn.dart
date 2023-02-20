import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () {},
              child: Text("Selam!", style: Theme.of(context).textTheme.subtitle1,),
              //style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
                if(states.contains(MaterialState.pressed)){
                  return Colors.greenAccent;
                }
                return Colors.blue;
              })),
          ),
          ElevatedButton(onPressed: null, child: Text("Naber!")),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined)),
          FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.all(10),
              ),
              onPressed: (){}, child: Text("Merhaba")),
          InkWell(onTap: (){}, child: Text("custom")),
          OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.save), label: Text("selam")),
          Container(
            height: 200,
            color: Colors.white,
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
              ),
              onPressed: (){}, child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                child: Text("Place Bid", style: Theme.of(context).textTheme.headline5,),
              )),
        ],
      ),
    );
  }
}
