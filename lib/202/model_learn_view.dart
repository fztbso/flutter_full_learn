import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {

  var user9 = PostModel8(body: "a");

  @override
  void initState() {
    super.initState();
    final user1 = PostModel()
    ..userId = 1
    ..body = "bso";
    user1.body = "hello";

    final user2 = PostModel2(1, 2, "sss", "aaa");
    user2.body = "aaa";

    final user3 = PostModel3(1, 2, "a", "b");
    // user3.body = "a";


      // localde işlem yapıyorsak bu olabilir
    final user4 = PostModel4(userId: 1, id: 2, title: "a", body: "b");
    // user4.body = "a";

    // final user5 = PostModel5(userId: 1, id: 2, title: "title", body: "body");

      // Servisten data çekiyorsak en mantıklısı bu
    final user8 = PostModel8(body: "a");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            user9 = PostModel8(title: "On Pressed");
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.title ?? "Not have any data"),
      ),

    );
  }
}
