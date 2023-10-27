import 'package:flutter/material.dart';
import 'package:pop_app/features/Edit%20Profile/presentation/widgets/Edir_profile_body.dart';

class Edit_profile extends StatefulWidget {
  const Edit_profile({super.key});

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Edit_profile_body(),
    );
  }
}