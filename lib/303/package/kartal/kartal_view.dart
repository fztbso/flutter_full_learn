import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:kartal/kartal.dart';

typedef ImageLoader = void Function(String url);
class KartalView extends StatefulWidget {
  const KartalView({Key? key, this.onImage}) : super(key: key);

  final ImageLoader? onImage;
  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              context.navigateToPage(ImageLearn202(), type: SlideType.LEFT);
            },
            child: Text("Kartal",
              style: context.textTheme.headline1,
            ),
          ),
          IconButton(onPressed: (){},
              icon:Icon (context.isIOSDevice ? Icons.ios_share_outlined : Icons.android_outlined)).toDisabled(true),
          AnimatedContainer(
            duration: context.durationLow,
            color: Colors.orangeAccent,
            height: context.dynamicHeight(context.isKeyBoardOpen ? 0 : 0.1),
          ),
          TextField(),
          Image.network("".randomSquareImage),
        ],
      ),
    );
  }
}
