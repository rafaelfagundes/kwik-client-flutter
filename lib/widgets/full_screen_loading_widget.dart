import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FullScreenLoadingWidget extends StatelessWidget {
  const FullScreenLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Lottie.asset(
            'assets/animations/loading.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
