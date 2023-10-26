import 'package:flutter/material.dart';
import 'package:pop_app/core/utils/posts.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/model/backend.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/ChatBubble.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Chat_Body.dart';

class BottomText extends StatefulWidget {
  const BottomText({super.key});

  @override
  State<BottomText> createState() => _BottomTextState();
}

class _BottomTextState extends State<BottomText> {
  final TextEditingController _messengeTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.black,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.airplane_ticket_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: _messengeTextController,
                    decoration: InputDecoration(
                      hintText: "Write message...",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    // Navigator.push(context,
                    // Material(child: (context)=>ChatBubble(text: _messengeTextController.text.toString(), isCurrentUser: true)) as Route<Object?>
                    // );
                    message(
                        list_posts[index.key],
                        _messengeTextController.text.toString());
                    ChatBubble(
                      text: _messengeTextController.text.toString(),
                      isCurrentUser: true,
                    );
                    get_message('-NhfRXV69ucUVGF2zrcR');
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: kMainColor,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
