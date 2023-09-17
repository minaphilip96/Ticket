import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/features/login/presentation/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:kMainColor,
      body: LoginBody(),
    );
  }
}