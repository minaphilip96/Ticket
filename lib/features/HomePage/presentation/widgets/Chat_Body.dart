import 'package:flutter/material.dart';
import 'package:pop_app/core/widgets/custom_appbar.dart';
import 'package:pop_app/core/widgets/custom_buttom_text.dart';

class ChatBody extends StatefulWidget {

ChatBody({
    Key? key,
    required this.postID,
 
  }) : super(key: key);
String postID;
  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
        children:<Widget>[
          BottomText(), 
          AppBarForChat()
        ],
        ),
    );
  }
}