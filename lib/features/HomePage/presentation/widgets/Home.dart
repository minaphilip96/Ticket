import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/Loding.dart';
import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/core/utils/posts.dart';
import 'package:pop_app/features/Createpost/presentation/Create_post.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Chat_Body.dart';
import 'package:pop_app/model/backend.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    appcontroller.getpost();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_list,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<AppController>(
        init: AppController(),
        builder: (controller) => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: controller.list_posts.length,
          itemBuilder: (BuildContext context, int index) {
            dynamic post = controller.list_posts[index].value;
            return PostItem(
                playersNumber: post['players'] ?? '',
                index: index,
                img: post['img'] ?? '',
                name: post['owner'] ?? '',
                dp: post['body'] ?? '',
                time: '${getTheDifrrenceTime(post['time'] ?? '')} Min Ago');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () =>
            //readuser(userid)
            //readmessages(messageid)
            Get.to(() => const CreatePost()),
      ),
    );
  }
}

String getTheDifrrenceTime(String time) {
  return DateTime.now().difference(DateTime.parse(time)).inMinutes.toString();
}
