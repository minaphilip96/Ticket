//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
//import 'package:my_app/core/widgets/custom_buttom.dart';
import 'package:pop_app/core/widgets/text_labal.dart';
//import 'package:my_app/features/HomePage/presentation/HomePage.dart';
//import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
 
class _SignUpScreenState extends State<SignUpScreen> {
   final TextEditingController _passwordTextController = TextEditingController();
   final TextEditingController _emailTextController = TextEditingController();
   final TextEditingController _userNameTextController = TextEditingController();
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
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
              //signinandsignup(context, false, (){
                //FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value){
                    // Get.to(()=> const homepage(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                //});
              //})
              ],
            ),
              ),
          ),
          ),
        );
  }
}
