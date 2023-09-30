import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


//post function and all its branches



void post() {
  final databaseReference = FirebaseDatabase.instance.ref("/posts");
  databaseReference.set({
  "id": "null",
  "title": "null",
  "body":"null",
  "members":"",
  "owner":""
  
});
   

  }

  void members() {
  final databaseReference = FirebaseDatabase.instance.ref("/posts/members");
  databaseReference.set({
  "member": "id",
  
  
});
   

  }
    void owner() {
  final databaseReference = FirebaseDatabase.instance.ref("/posts/owner");
  databaseReference.set({
  "id": "value",
  "name": "value",
  "profile": "value",
  "age": "value",

  
  
});
   

  }
//groups function and all its branches 


    void groupbranch() {
  final databaseReference = FirebaseDatabase.instance.ref("/groups");
  databaseReference.set({
  "group1": "value",

});
  final groupsbranch = FirebaseDatabase.instance.ref("/groups/group1");
  groupsbranch.set({
  "post": "id",
});

  }