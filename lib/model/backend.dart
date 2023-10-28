import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//firestore imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/features/Createpost/presentation/widgets/Createpostbody.dart';
import 'package:pop_app/features/HomePage/presentation/HomePage.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Chat_Body.dart';

List<dynamic> splitgroupid = [];
List<dynamic> groupusersdata = [];
String group_name = "";

class AppController extends GetxController {
  var userid;
  var messageid;

  String ownerId = FirebaseAuth.instance.currentUser?.uid ?? '';
  List groupids = [];
  List<DataSnapshot> list_posts = [];
//REAL_TIME DATABASE
//post function and all its branches
  // void GetUserDeatils()
  // {
  //   FirebaseFirestore.instance.doc(ownerId)
  // }
  Future<void> createpost(String body, String game, String players) async {
    final postsReference = FirebaseDatabase.instance.ref("posts");
    DatabaseReference newpost = postsReference.push();
    await newpost.set({
      "body": body,
      "owner": ownerId,
      "ownerName": ownerId,
      "game": game,
      "players": players,
      "time": DateTime.now().toString()
    });
//var snap = event.snapshot;

    final postbranchReference =
        FirebaseDatabase.instance.ref("${newpost.path}/group/members");
    await postbranchReference.set({
      "owner": ownerId,
    });

    Get.to(() => const homepage(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500));
  }

  Future<void> message(postId, text, ScrollController scrollController) {
    var messagesReference =
        FirebaseDatabase.instance.ref("posts/$postId/group/messages");
    messagesReference = messagesReference.push();
    var userId = FirebaseAuth.instance.currentUser?.uid;
    return messagesReference.set({
      "text": text,
      "sender id": userId,
      "time": DateTime.now().toString(),
    }).then((value) =>
        scrollController.jumpTo(scrollController.position.maxScrollExtent));
  }

//read functions

  void getpost() async {
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
    for (var element in groups.children) {
      group.add(element);
    }
  }

  Future<void> createuser(String name, String userid) async {
    DocumentReference users =
        FirebaseFirestore.instance.collection("users").doc(userid);
    await users
        .set({'name': name, 'bio': "", 'id': userid})
        .then((value) => null)
        .catchError((error) => print("Failed to add user: $error"));
  }

  var users;
  dynamic userdata = {};
  void readuser() {
    String? userid = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance.collection("users").doc(userid).get().then(
      (DocumentSnapshot doc) {
        final data = doc.data();
        userdata = data;
        print(userid);

        print(doc.data());
      },
    );
  }

  Future<void> readgroupusers(postId) async {
    groupusersdata.clear();
    print("hi");

    DataSnapshot groups = await FirebaseDatabase.instance
        .ref("posts/$postId/group/members")
        .get();
    List<String> splitgroupid =
        groups.child("group-id").value.toString().split("_");
    print(splitgroupid.length);
    splitgroupid.forEach((element) async {
      final docRef =
          FirebaseFirestore.instance.collection("users").doc(element);
      final result = await docRef.get();

      final data = result.data();
      print(data);

      groupusersdata.add(data);
      print(groupusersdata);
    });

//print(groupusersdata[0]);

    for (int i = 0; i <= groupusersdata.length - 1; i++) {
      group_name += groupusersdata[i];
    }
    print(groupusersdata);
  }

  void add_player(postId) async {
    DataSnapshot groups = await FirebaseDatabase.instance
        .ref("posts/$postId/group/members")
        .get();
    var playerid = FirebaseAuth.instance.currentUser?.uid;
    if (groups.child("group-id").value.toString().contains(playerid!)) {
      Get.to(() => ChatBody(postID: postId));
      groupsnack(userdata);
    } else {
      if (!groups.child("group-id").value.toString().contains(playerid)) {
        String createChatroomid = "${groups.child("group-id").value}_$playerid";
        String chatroomId =
            createChatroomid.replaceAll("null_", ""); //look at dis

        final messagesReference =
            FirebaseDatabase.instance.ref("posts/$postId/group/members");
        await messagesReference.set({
          "group-id": chatroomId,
        });
      }

      Get.to(() => ChatBody(postID: postId));
    }
  }

  List messages = [];
  ScrollController scrollController = ScrollController();

  void getmessages(
    String postId,
  ) async {
    messages.clear();
    DataSnapshot messagesData = await FirebaseDatabase.instance
        .ref("posts/$postId/group/messages")
        .get();

    for (var element in messagesData.children) {
      messages.add(element.value);
    }
    listenOnMessages(postId);
    update();
  }

  void getUsers(
    String postId,
  ) async {
    DataSnapshot griopID = await FirebaseDatabase.instance
        .ref("posts/$postId/group/members")
        .get();

    List<String> membersID =
        griopID.value.toString().replaceAll('group-id: ', '').split('_');
    readusers(membersID);
  }

  List<DocumentSnapshot> usersdata = [];
  void readusers(List<String> usersid) {
    for (var element in usersid) {
      FirebaseFirestore.instance.collection("users").doc(element).get().then(
        (DocumentSnapshot doc) {
          usersdata.add(doc);
          print(usersdata[0].data());
        },
      );
    }
  }

  void listenOnMessages(String postID) {
    DatabaseReference reference =
        FirebaseDatabase.instance.ref('posts/$postID/group/messages');
    reference.onValue.listen((querySnapshot) {
      messages.addIf(
          !messages.contains(querySnapshot.snapshot.children.last.value),
          querySnapshot.snapshot.children.last.value);

      update();
    });
  }
}

void emptymessage() async {
  Get.snackbar(
    "Error",
    "Can't send an empty message",
    maxWidth: 150,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: kMainColor,
    colorText: Colors.white,
  );
}

String username = "";

void groupsnack(userdata) async {
  username = userdata["name"];

  Get.snackbar(
    "Dear $username",
    "You are already a participant in the group",
    maxWidth: 250,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: kMainColor,
    colorText: Colors.white,
  );
}
