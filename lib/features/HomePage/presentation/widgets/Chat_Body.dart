import 'package:flutter/material.dart';
import 'package:pop_app/core/widgets/custom_appbar.dart';
import 'package:pop_app/core/widgets/custom_buttom_text.dart';
import 'package:pop_app/model/backend.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/ChatBubble.dart';



class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: chatAppbar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
        children:<Widget>[
            ChatBubble(text: 'mina', isCurrentUser: true),
             ChatBubble(text: 'n3m', isCurrentUser: false),
                          ChatBubble(text:"hello", isCurrentUser: true),
            BottomText(), 
        ],
        ),
    );
  }
}