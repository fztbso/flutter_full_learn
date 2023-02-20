import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({Key? key}) : super(key: key);

  final String _title = "Welcome";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        //centerTitle: true,
        //backgroundColor: Colors.transparent, //bu ve elevation sıfır 0 vererek appbar ile sayfa aynı renk yapabiliyoruz
        //elevation: 0,
        //systemOverlayStyle: SystemUiOverlayStyle.light, //en üstteki saat wifi batarya işaret rengi
        leading: Icon(Icons.backspace_outlined), //sol taraf menü
        //leadingWidth: 40, //sol menünün yakınlığını değiştirme
        //actionsIconTheme: IconThemeData(color: Colors.yellowAccent),
        //toolbarTextStyle: TextStyle(color: Colors.orangeAccent), //actions içindeki yazının style
        //automaticallyImplyLeading: false, //sayfada otomatik olarak back butonu gelmesin demek
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.mail_lock_outlined)),
          Center(child: CircularProgressIndicator(),)
        ],
      ),
    );
  }
}
