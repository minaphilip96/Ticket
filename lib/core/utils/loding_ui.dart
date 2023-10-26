import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// please install dependencies in pubspec.yaml 

class loding_ui extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.white,
            size: 200
          ),
        ),
      ),
    );
  }
}
