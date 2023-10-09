import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//firestore imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

//REAL_TIME DATABASE
//post function and all its branches

class chatservice extends ChangeNotifier{
  
}

void createpost(postId) {
  final postsReference = FirebaseDatabase.instance.ref("posts");
  DatabaseReference newpost= postsReference.push();
  newpost.set({
  "title": "null",
  "body":"null",
  "owner":"null",
});
  
    final postbranchReference = FirebaseDatabase.instance.ref("/posts/$postId/members");
    postbranchReference.set({
      "owner":"account-id"
    });

  }

  void members(postId) {
  final membersReference = FirebaseDatabase.instance.ref("/posts/$postId/members");
  
  membersReference.update({
  "member1": "account id ",
});
   

  }

//groups function and all its branches 


    void groupbranch(postId) {
  final groupsReference = FirebaseDatabase.instance.ref("group");
  DatabaseReference newgroup= groupsReference.child(postId);
  newgroup.set({
  "post": "post id",
});

  }

void message(String postId) {
  final messagesReference = FirebaseDatabase.instance.ref("/group/$postId/messages");
  DatabaseReference newmessage= messagesReference.push();
  newmessage.set({
  "text": "value",
  "sender id ": "account-id",
  "time": "value",
});

  }

//read functions


List posts2=[];
void  getpost() async {
    posts2.clear();
    DataSnapshot posts = await FirebaseDatabase.instance.ref().get();

         for (var element in posts.children) {
          posts2.add(element);
          print(element.value);
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
Future<void> test2(){


CollectionReference users = FirebaseFirestore.instance.collection("users");

      return users
          .add({
            'name': "fullName", 
            'image': "value?",
            'age': "22" ,
            'bio': "value" 
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    
}
 var db;
 dynamic lol;
void read(){
 db = FirebaseFirestore.instance;
final docRef = db.collection("users").doc("N4SbmCPDInfmeyJrSgt8");
docRef.get().then(
  (DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

  },
  
  
);
}
//FIRESTORE DATABASE
