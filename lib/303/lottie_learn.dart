import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/constant/duration_items.dart';
import 'package:flutter_full_learn/product/constant/lottie_items.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.duraitonNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              controller.animateTo(isLight ? 1 : 0.5);
              isLight = !isLight;
              context.read<ThemeNotifier>().changeTheme();
            },
            child: Lottie.asset(LottieItems.themeChange.lottiePath,
              repeat: false,
              controller: controller,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Lottie.network("https://assets1.lottiefiles.com/packages/lf20_pvjwvcvn.json",),
          LoadingLottie(),
        ],
      ),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);

  final _loadingLottie = "https://assets2.lottiefiles.com/packages/lf20_ydo1amjm.json";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Lottie.network(_loadingLottie)),
      ],
    );
  }
}
