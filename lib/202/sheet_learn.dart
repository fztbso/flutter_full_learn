import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/list_view_learn.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgrounColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgrounColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         final result = await showModalBottomSheet(
             context: context,
             backgroundColor: Colors.grey,
             // barrierColor: Colors.grey,
             // isScrollControlled: true,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
             builder: (context){
               return _CustomSheet(backgrounColor: _backgrounColor,);
             });

         if(result is bool){
           setState(() {
             _backgrounColor = Colors.cyan;
           });
         }

        },
        child: Icon(Icons.share),
      ),
      body: Center(
        child: TextButton(onPressed: (){
          showCustomShet(context, ListViewLearn());
        }, child: Text("Show")),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
    required Color backgrounColor,
  }) : super(key: key);


  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgrounColor = Colors.white;
  final double _gripHeight = 24;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _gripHeight,
              child: Stack(
                children: [
                  Divider(
                    color: Colors.black26, thickness: 3,
                    indent: MediaQuery.of(context).size.width*0.45,
                    endIndent: MediaQuery.of(context).size.width*0.45,),
                  Positioned(
                    right: 0,
                      top: 0,
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.close),
                    ),
                  )),
                ],
              ),
            ),
            Text("data22"),
            Image.network("https://picsum.photos/200", height: 200,),
            ElevatedButton(
                onPressed: (){
                setState(() {
                _backgrounColor = Colors.amber;
              });
              Navigator.of(context).pop<bool>(true);
            }, child: Text("OK")),
          ],
        ),
      ),
    );
  }
}


mixin ProductSheetMixin {
  Future<T?> showCustomShet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        context: context,
        backgroundColor: Colors.grey,
        // barrierColor: Colors.grey,
        // isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context){
          return _CustomMainSheet(child: child);
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
   _CustomMainSheet({Key? key, required this.child}) : super(key: key);
  final Widget child;

  Color _backgrounColor = Colors.white;
  final double _gripHeight = 24;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _BaseSheetHeader(),
            Expanded(child: child)
          ],
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    Key? key,
  }) : _gripHeight = 30, super(key: key);

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
            color: Colors.black26, thickness: 3,
            indent: MediaQuery.of(context).size.width*0.45,
            endIndent: MediaQuery.of(context).size.width*0.45,),
          Positioned(
              right: 0,
              top: 0,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.close),
                ),
              )),
        ],
      ),
    );
  }
}
