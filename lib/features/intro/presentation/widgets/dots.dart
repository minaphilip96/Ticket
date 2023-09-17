import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator( {Key? key,@required this.dotIndex}) : super(key: key);
  final num? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: kMainColor),
          )),
      position : dotIndex!.toInt(),dotsCount: 3,
    );
  }
}