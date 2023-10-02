import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/features/HomePage/presentation/HomePage.dart';

class CreatePostBody extends StatefulWidget {
  const CreatePostBody({super.key});

  @override
  State<CreatePostBody> createState() => _CreatePostBodyState();
}

class _CreatePostBodyState extends State<CreatePostBody> {
   final TextEditingController _postTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[GestureDetector(onTap: () {
              Get.to(()=> const homepage(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));

        },
        child: Container(
        height: 60,
        width:70,
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'POST',
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            )
        ),
        ),
        ),
   
        ],
        title: const Text(
          "Create post",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
    body: Column(
      children:[
        SizedBox(height: 15,),
        TextField(
    controller: _postTextController,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.post_add_outlined,
        color: Colors.white70,
      ),
      labelText: 'Write Your Post',
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    maxLines: 5,
    maxLength: 120,
  ),
      Container(
        margin: EdgeInsets.all(50),
        height: 200,
        width: 200,
        child: Image.asset(kLogo),)
      ],
    ),

    );
  }
}