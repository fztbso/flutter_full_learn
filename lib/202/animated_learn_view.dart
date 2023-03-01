import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin{

  //Text("data", style: context.textTheme().headline1,)

  bool _isVisible = false;

  bool _isOpacity = false;

  void _changeVisible () {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity () {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(isVisible: _isVisible),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _changeVisible();
          controller.animateTo(_isVisible ? 1 : 0);
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                duration: _DurationItems.durationLow,
                opacity: _isOpacity ? 1 : 0,
                child: Text("ddddd")),
            trailing: IconButton(onPressed: (){
              _changeOpacity();
            },
              icon: Icon(Icons.precision_manufacturing_rounded),
            ),
          ),

          AnimatedDefaultTextStyle(child: Text("aaa"),
              style: (_isVisible ? context.textTheme().headline1 : context.textTheme().subtitle1) ?? TextStyle(),
              duration: _DurationItems.durationLow),

          AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: controller,
          ),

          AnimatedContainer(duration: _DurationItems.durationLow,
            height: _isVisible ? 0 : MediaQuery.of(context).size.width * 0.2,
            width: (MediaQuery.of(context).size.height) * 0.2,
            color: Colors.blue,
          ),

          Expanded(child: Stack(
            children: [
              AnimatedPositioned(child: Text("qwerty"), top: 30, duration: _DurationItems.durationLow, curve: Curves.easeInCubic,),
            ],
          )),

          Expanded(child: AnimatedList(itemBuilder: (context, index, animation){
            return Text("data");
          })),
        ],
      ),
    );
  }
}

class _placeHolderWidget extends StatelessWidget {
  const _placeHolderWidget({
    Key? key,
    required bool isVisible,
  }) : _isVisible = isVisible, super(key: key);

  final bool _isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Placeholder(color: Colors.yellow,),
        secondChild: SizedBox.shrink(),
        crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _DurationItems.durationLow,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme(){
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}