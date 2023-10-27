import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/widgets/custom_appbar.dart';
import 'package:pop_app/core/widgets/custom_buttom_text.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/ChatBubble.dart';
import 'package:pop_app/model/backend.dart';
var appcontroller=Get.put(AppController());
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
    ScrollController scrollController =  ScrollController();

  @override
  void initState() {
 appcontroller.getmessages(widget.postID,scrollController);

 appcontroller.listenOnMessages(widget.postID);
  

 super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: chatAppbar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
        children:<Widget>[
          GetBuilder<AppController>(
init: AppController(),
            builder: (controller) =>  Expanded( 
              child: ListView.builder(
                controller: scrollController,
                
                itemBuilder: (context, index) =>  ChatBubble(text:  controller.messages[index]['text'], isCurrentUser: controller. messages[index]['sender id']== controller.ownerId),
                
                itemCount: controller. messages.length,
                
                ),
            ),
          ),
                      BottomTextPost(postID: widget.postID,scrollController: scrollController), 

           
           
        ],
        ),
    );
  }
}