import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/Loding.dart';
import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/core/utils/posts.dart';
import 'package:pop_app/features/Createpost/presentation/Create_post.dart';
import 'package:pop_app/model/backend.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
      
      setState(() {
        getpost();
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
            ),
            onPressed: (){},
          ),
        ],
      ),


      body:ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: list_posts.length,
        itemBuilder: (BuildContext context, int index) {

          dynamic post = list_posts[index].value;
          print(post);
          return PostItem(
            img: post['img']??'',
            name: post['owner']??'',
            dp: post['body']??'',
            time:getTheDifrrenceTime(post['time']??'')+' Min Ago'
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        child: Icon(
          Icons.add,
        ),
        onPressed : ()=> 
             Get.to(()=> CreatePost()),
        
      ),
    );
  }
}

String getTheDifrrenceTime(String time)
{
 return DateTime.now().difference(DateTime.parse( time)).inMinutes.toString();
  
}