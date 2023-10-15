//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pop_app/core/constants.dart';
//import 'package:my_app/core/widgets/custom_buttom.dart';
import 'package:pop_app/core/widgets/text_labal.dart';
import 'package:pop_app/features/login/presentation/login_view.dart';
import 'package:pop_app/model/backend.dart';
import 'package:pop_app/features/login/presentation/widgets/signup.dart';
import '../../../../core/widgets/custom_buttom.dart';
import '../../../HomePage/presentation/HomePage.dart';
//import 'package:my_app/features/HomePage/presentation/HomePage.dart';
//import 'package:get/get.dart';
   final TextEditingController passwordTextController = TextEditingController();
   final TextEditingController emailTextController = TextEditingController();
   final TextEditingController userNameTextController = TextEditingController();

class SignUpScreen extends StatefulWidget {
  
  
   
   SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   
   
  @override
  Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: kMainColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email ", Icons.person_outline, false,
                    emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    passwordTextController),
                const SizedBox(
                  height: 20,
                ),
              signinandsignup(context, false, (){
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text).then((value){
                     createuser(userNameTextController.text);
                     Get.to(()=> const LoginView(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                });
              })
              ],
            ),
              ),
          ),
          ),
        );
  }
}
