import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/Loding.dart';
import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/core/utils/posts.dart';
import 'package:pop_app/features/Createpost/presentation/Create_post.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feeds"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: (){},
          ),
        ],
      ),


      body:ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {

          Map post = posts[index];
          return PostItem(
            img: post['img'],
            name: post['name'],
            dp: post['dp'],
            time: post['time'],
          );
        },
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: kMainColor,
        child: Icon(
          Icons.add,
        ),
        onPressed:(){ 
        Get.to(()=>  CreatePost(),transition:Transition.rightToLeft,duration:  Duration(milliseconds: 500));
        }
      ),
    );
  }
}