import 'package:flutter/material.dart';

import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/core/utils/size_config.dart';
import 'package:pop_app/core/widgets/custom_buttom.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Chat_Body.dart';
import 'package:pop_app/model/backend.dart';

class PostItem extends StatefulWidget {
  final String dp;
  final String name;
  final String time;
  final String img;
  final int index;
  final String playersNumber;

  const PostItem({
    Key? key,
    required this.dp,
    required this.name,
    required this.time,
    required this.img,
    required this.index,
    required this.playersNumber,
  }) : super(key: key);
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                "${appcontroller.list_posts[widget.index].child("game").value}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  appcontroller
                      .add_player(appcontroller.list_posts[widget.index].key);

                  // getmessages (list_posts[widget.index].key);
                  // message(list_posts[widget.index].key);
                },
                child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      appcontroller.add_player(
                          appcontroller.list_posts[widget.index].key);
                      appcontroller.readgroupusers(
                          appcontroller.list_posts[widget.index].key);
                      // appcontroller.getUsers(
                      //     appcontroller.list_posts[widget.index].key ?? '');
                      // appcontroller.getUsers(
                      //     appcontroller.list_posts[widget.index].key ?? '');
                      // message(list_posts[widget.index].key);
                      //listenOnMessages(posts[widget.index]);
                    },
                    child: const Center(
                        child: Text(
                      'Ticket',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    )),
                  ),
                ),
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.time,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${widget.playersNumber} players',
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 3, 10),
                    child: Text(
                      widget.dp,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 3,
              thickness: 2,
              color: Colors.grey,
              endIndent: 3,
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
