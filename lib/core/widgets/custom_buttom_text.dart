import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/ChatBubble.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Chat_Body.dart';
import 'package:pop_app/model/backend.dart';

class BottomTextPost extends StatefulWidget {
  BottomTextPost({
    Key? key,
    required this.postID,
     required this.scrollController,

  }) : super(key: key);
  String postID;
    ScrollController scrollController;

  @override
  State<BottomTextPost> createState() => _BottomTextPostState();
}

class _BottomTextPostState extends State<BottomTextPost> {
   final TextEditingController _messengeTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.airplane_ticket_rounded, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller:_messengeTextController ,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none
                      ),
                      
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                  if ( _messengeTextController.text!=""){    
                 appcontroller.message(widget.postID, _messengeTextController.text,widget.scrollController);
                 _messengeTextController.clear();
                  }
                  else {
                      emptymessage();
                  }

                      //Navigator.push(context,
                      //Material(builder: (context)=>ChatBubble(text: _messengeTextController.text.toString(), isCurrentUser: true))
                      //);
                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
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