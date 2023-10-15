import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/size_config.dart';
import 'package:pop_app/core/widgets/custom_buttom.dart';

class PostItem extends StatefulWidget {
  final String dp;
  final String name;
  final String time;
  final String img;


  PostItem({
    Key? key,
    required this.dp,
    required this.name,
    required this.time,
    required this.img
  }) : super(key: key);
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        child: Column(
          children: <Widget>[
            ListTile(
           

              contentPadding: EdgeInsets.all(0),
              title: Text(
                "${widget.name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),  
              ),
      
      trailing: GestureDetector( 
      onTap: (){},
      child: Container(
        height: 40,
        width: 50,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Ticket',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          )
          ),
        ),
      ),
              subtitle:
              Column(
                children: [
                  Text("${widget.time}",),
                  Container(   
                    padding: const EdgeInsets.fromLTRB(0, 10, 3, 10),
                    child:Text("${widget.dp}",
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 17
                    ),
                    ),
                    ),
                ],
              ),
              
            ),
        Divider(
            indent: 3,
            thickness: 2,
            color: Colors.grey,
            endIndent: 3,
        ),
    

          ],
        ),
        onTap: (){},
      ),
    );
  }
}