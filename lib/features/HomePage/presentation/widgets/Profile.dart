import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'dart:math';

import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/features/Edit%20Profile/presentation/Edit_profile.dart';
import 'package:pop_app/features/login/presentation/login_view.dart';
import 'package:pop_app/features/login/presentation/widgets/signup.dart';
import 'package:pop_app/features/splash/presentation/widgets/splash_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

String email=emailTextController.text;
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
                names[random.nextInt(10)],
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
                      Icons.logout_outlined,
                      color: Colors.white,
                    ),
                    onPressed: ()async{
                  final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
                  sharedPreferences.remove('email');
                Get.to(()=> LoginView(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));

                    },
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: (){
               Get.to(()=> Edit_profile(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                    },
                  ),

                ],
              ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Container(child: Text('Email: $finalEmail',
                   style: TextStyle(fontSize: 15,fontFamily: 'Monospace' ),
                   )
                   ,)
                  ],
                ),
            ],
                  ),
        ),
      ),
    );
                }
}