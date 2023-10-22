import 'package:flutter/material.dart';
import 'package:pop_app/features/Edit_profile/presentation/widgets/edit_body.dart';

class Edit_profile extends StatelessWidget {
  const Edit_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Edit_profile_body(),
    );
  }
}