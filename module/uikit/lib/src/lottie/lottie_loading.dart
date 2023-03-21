import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
