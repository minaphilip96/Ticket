import 'package:flutter/material.dart';
import 'package:pop_app/features/intro/presentation/widgets/introbody.dart';

class intro extends StatelessWidget {
  const intro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.black,
      body: introbody(),
    );
  }
}