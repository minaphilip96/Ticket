import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//firestore imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/features/Createpost/presentation/Create_post.dart';
import 'package:pop_app/features/HomePage/presentation/HomePage.dart';
var userid;
//REAL_TIME DATABASE
//post function and all its branches

class chatservice extends ChangeNotifier{
  
}

void createpost(String body,String owner,String game, String players) {
   
  final postsReference = FirebaseDatabase.instance.ref("posts");
  DatabaseReference newpost= postsReference.push();
  newpost.set({
  "body":body,
  "owner":owner,
  "game": game,
  "players": players,
  "time":DateTime.now().toString()
});
  
    final postbranchReference = FirebaseDatabase.instance.ref("${newpost.path}/members");
    postbranchReference.set({
      "owner":"account-id"
    });
  Get.to(()=> const homepage(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));
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

void message(String postId, String string) {
  final messagesReference = FirebaseDatabase.instance.ref("/group/$postId/messages");
  DatabaseReference newmessage= messagesReference.push();
  newmessage.set({
  "text": "value",
  "sender id ": "account-id",
  "time": "value",
});

  }

//read functions


List list_posts=[];
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
  for (var element in groups.children) {
    group.add(element);
  }
}

//END OF REALTIME DATABSE
Future<void> createuser(String name) {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  return users
      .add({'name': name, 'image': "value?", 'bio': "value"})
      .then((DocumentReference usersdocument) => userid = usersdocument.id)
      .catchError((error) => print("Failed to add user: $error"));
}

var users;
dynamic userdata;
void readuser(userid) {
  users = FirebaseFirestore.instance;
  final docRef = users.collection("users").doc(userid);
  docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      userdata = data;
    },
  );
}
//FIRESTORE DATABASE

void get_message(groupid) {
  final groupref = FirebaseDatabase.instance.ref('/group/$groupid');
  final Messageref = FirebaseDatabase.instance.ref('/group/$groupid/messages');

  Messageref.onValue.listen((DatabaseEvent event) {
    final data2 = event.snapshot.value;
    // print(data2);
    print(data2);
  });
}

