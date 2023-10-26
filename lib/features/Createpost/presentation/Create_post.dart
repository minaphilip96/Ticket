import 'package:flutter/material.dart';
import 'package:pop_app/features/Createpost/presentation/widgets/Createpostbody.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          body: CreatePostBody(),
    );
  }
}