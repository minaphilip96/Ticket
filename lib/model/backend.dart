import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//firestore imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/features/HomePage/presentation/HomePage.dart';
var userid;
var messageid;
var postId;
String ownerId = FirebaseAuth.instance.currentUser!.uid;
List groupids= [];
List <DataSnapshot> list_posts=[];
//REAL_TIME DATABASE
//post function and all its branches



void createpost (String body,String game, String players) {
   
  //create a new list everytime or no need?

  
  final postsReference = FirebaseDatabase.instance.ref("posts");
  DatabaseReference newpost= postsReference.push();
  newpost
  .set({
  "body":body,
  "owner":ownerId,
  "game": game,
  "players": players,
  "time":DateTime.now().toString()

});
//var snap = event.snapshot;
    
  
    final postbranchReference = FirebaseDatabase.instance.ref("${newpost.path}/group/members");
    postbranchReference.set({
      "owner":ownerId, //change to name 
      

    });
  Get.to(()=> const homepage(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));

  }

 // void members(postId) {
 // final membersReference = FirebaseDatabase.instance.ref("/posts/$postId/members");
  
 // membersReference.update({
 // "member1": "account id ",
//});
   

 // }

//groups function and all its branches 


   
  
  

Future<void> message(List groupids,postId) {
  final messagesReference = FirebaseDatabase.instance.ref("posts/$postId/group/messages");//post id needs to be added
  var userId = FirebaseAuth.instance.currentUser?.uid;
  
  return messagesReference
  .set({
  "text": "value",
  "sender id ": userId,
  "time": "value",
});
  
  }

//read functions



void  getpost() async {
    list_posts.clear();
    DataSnapshot posts = await FirebaseDatabase.instance.ref('posts').get();
         for (var element in posts.children) {
          list_posts.add(element);
          print(list_posts.length);
      }

}

List group = [];
void getgroup() async {
  group.clear();
  DataSnapshot groups = await FirebaseDatabase.instance.ref("group").get();
  for (var element in groups.children){
       group.add(element); 
       
  } 
  

}

//END OF REALTIME DATABSE
Future<void> createuser(String name){


CollectionReference users = FirebaseFirestore.instance.collection("users");
      return users
          .add({
            'name': name, 
            'image': "value?",
            'bio': "value" 
          })
          .then((DocumentReference usersdocument) => userid=usersdocument.id)
          .catchError((error) => print("Failed to add user: $error"));
    
}
 var users;
 dynamic userdata;
void readuser(userid){
 users = FirebaseFirestore.instance;
final docRef = users.collection("users").doc(userid);
docRef.get().then(
  (DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    userdata=data;
    print(userdata);
  },
);
}
//FIRESTORE DATABASE
var messages;
 dynamic messagesdata;
void readmessages(messageid){
 messages = FirebaseFirestore.instance;
final docRef = messages.collection("messages").doc(messageid);
docRef.get().then(
  (DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    messagesdata=data;

    print(messagesdata["group-id"]);
  },
);
}

void logic(playercount){
if (messagesdata["group-id"].value.length==28){
//Get to 
add_player(postId);

}
else if (playercount ){ //condition to check the number of joined players and the required ones 
//add whom presses on the button
}
}
void add_player(postId)async{
 DataSnapshot groups = await FirebaseDatabase.instance.ref("posts/$postId/group/members").get();
 var playerid = FirebaseAuth.instance.currentUser?.uid;
 if (playerid==groups.child("owner").value){
  //snackbar
 }
 else{
  DataSnapshot groups = await FirebaseDatabase.instance.ref("posts/$postId/group/members").get();
  groupids.add(groups.child("group-id").value);
  String chatroomId =groups.child("group-id").value.toString()+"_$playerid";
  chatroomId.replaceAll("null", ""); //look at dis
  final messagesReference = FirebaseDatabase.instance.ref("posts/$postId/group/members");
  messagesReference.set({
    "group-id":chatroomId,
  });
 
 }
  
}