import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//firestore imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/features/HomePage/presentation/HomePage.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Chat_Body.dart';
 
List<dynamic> splitgroupid =[];
List<dynamic> groupusersdata =[];
String group_name= "";

class AppController extends GetxController
{

var userid;
var messageid;

String ownerId = FirebaseAuth.instance.currentUser!.uid;
List groupids= [];
List <DataSnapshot> list_posts=[];
//REAL_TIME DATABASE
//post function and all its branches



Future<void> createpost (String body,String game, String players) async {


  
  final postsReference =   FirebaseDatabase.instance.ref("posts");
  DatabaseReference newpost= postsReference.push();
 await newpost
  .set({
  "body":body,
  "owner":ownerId,
  "game": game,
  "players": players,
  "time":DateTime.now().toString()

});
//var snap = event.snapshot;
    
  
    final postbranchReference = FirebaseDatabase.instance.ref("${newpost.path}/group/members");
   await postbranchReference.set({
      "owner":ownerId, 
      

    });

  Get.to(()=> const homepage(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));

  }


   
  
  

Future<void> message(postId,text,ScrollController  scrollController) {
  var messagesReference = FirebaseDatabase.instance.ref("posts/$postId/group/messages");
 messagesReference= messagesReference.push();
  var userId = FirebaseAuth.instance.currentUser?.uid;
  return messagesReference
  .set({
  "text": text,
  "sender id": userId,
  "time": DateTime.now().toString(),
}).then((value) => scrollController.jumpTo(scrollController.position.maxScrollExtent));
  
  }

//read functions



void  getpost() async {
    list_posts.clear();
    DataSnapshot posts = await FirebaseDatabase.instance.ref('posts').get();
         for (var element in posts.children) {
          list_posts.add(element);
          print(list_posts.length); 
      }
update();
}

List group = [];
void getgroup() async {
  group.clear();
  DataSnapshot groups = await FirebaseDatabase.instance.ref("group").get();
  for (var element in groups.children){
       group.add(element); 
       
  } 
  

}


Future<void> createuser(String name){


CollectionReference users = FirebaseFirestore.instance.collection("users");
      return users
          .add({
            'name': name, 
            'bio': "value", 
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
    
    
  },
);
}


Future<void> readgroupusers(postId) async {
print("hi");
users = FirebaseFirestore.instance;
DataSnapshot groups = await FirebaseDatabase.instance.ref("posts/$postId/group/members").get();
splitgroupid=groups.child("group-id").value.toString().split("_");
print(splitgroupid);
for (var element in splitgroupid){
final docRef = users.collection("users").doc(element);
docRef.get().then(
  (DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    userdata = data;

    groupusersdata.add(userdata["name"]);
//print(groupusersdata[0]);
  },
  
);

for(int i=0;  i<=groupusersdata.length-1 ;i++)
  group_name+=groupusersdata[i];
}

 print(group_name);
}


void add_player(postId)async{
 DataSnapshot groups = await FirebaseDatabase.instance.ref("posts/$postId/group/members").get();
 var playerid = FirebaseAuth.instance.currentUser?.uid;
 if (groups.child("group-id").value.toString().contains(playerid!)){
  Get.to(()=> ChatBody(postID: postId));
  groupsnack (userdata);
 }
 else{
  
  
  

if (!groups.child("group-id").value.toString().contains(playerid)
) {
    String create_chatroomId =groups.child("group-id").value.toString()+"_$playerid";
  String chatroomId = create_chatroomId.replaceAll("null_", ""); //look at dis
  
  final messagesReference = FirebaseDatabase.instance.ref("posts/$postId/group/members");
 await messagesReference.set({
    "group-id":chatroomId,
  });
}

 Get.to(()=> ChatBody(postID: postId));
 
 }
  
}
List messages =[];

void getmessages (postId,ScrollController scrollController) async{

  messages.clear();
  DataSnapshot messages_data = await FirebaseDatabase.instance.ref("posts/$postId/group/messages").get();
  
  for (var element in messages_data.children){
       messages.add(element.value); 
  }
update();


}


void listenOnMessages(String postID) {
 
  DatabaseReference reference = FirebaseDatabase.instance.ref('posts/$postID/group/messages');
reference.onValue.listen((querySnapshot) {
messages.add(querySnapshot.snapshot.children.last.value);
update();
});
}
}


void emptymessage ()async{
   
  
  Get.snackbar("Error","Can't send an empty message",
  maxWidth:150 ,
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: kMainColor,
  colorText: Colors.white,
  );
}
String username ="";

void groupsnack (userdata)async{
  
   username=userdata["name"];
  
  Get.snackbar("Dear $username","You are already a participant in the group",
  maxWidth:250 ,
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: kMainColor,
  colorText: Colors.white,
  );
}



