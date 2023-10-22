//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
//import 'package:my_app/core/widgets/custom_buttom.dart';

import 'package:pop_app/core/widgets/text_labal.dart';
//import 'package:my_app/features/HomePage/presentation/HomePage.dart';
import 'package:pop_app/features/login/presentation/widgets/signup.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/widgets/custom_buttom.dart';
import '../../../HomePage/presentation/HomePage.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
      child: Padding(
      padding: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).size.height * 0.02, 20, 0),
      child: Column(
        children: <Widget>[
          const SizedBox(child: Text(""),height: 80,),
          Image.asset(kLogo),
           const SizedBox(
            height: 30,
          ),
          reusableTextField("Enter Email", Icons.person_outline, false,
              _emailTextController),
          const SizedBox(
            height: 20,
          ),
          reusableTextField("Enter Password", Icons.lock_outline, true,
              _passwordTextController),
          const SizedBox(
            height: 5,)
          ,const SizedBox(
            height: 20),
            signinandsignup(context, true, ()async{
               final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.setString('email', _emailTextController.text);
              FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value){
               Get.to(()=> const homepage(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));
              });
          },
            ) ,
            signUpOption()
          
          ],
          ),
          ),
        ),
      ),
    );
  }
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
               Get.to(()=> const SignUpScreen(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
 }  

        
  