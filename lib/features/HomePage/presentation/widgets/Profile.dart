import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
import 'dart:math';

import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Chat_Body.dart';
import 'package:pop_app/model/backend.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: 40),
              CircleAvatar(
                backgroundImage: AssetImage(
                  kIcon,
                ),
                radius: 50,
              ),
              SizedBox(height: 10),
              Text(
               appcontroller.  userdata["name"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 3),

              Text(
                "Status should be here",
                style: TextStyle(
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    onPressed: (){},
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: (){},
                  ),

                ],
              ),

              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Posts",
                          style: TextStyle(
                          ),
                        ),
                      ],
                    ),


                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Groups",
                          style: TextStyle(
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
                  ),
        ),
      ),
    );
                }
}