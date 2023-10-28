//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
//import 'package:my_app/core/widgets/custom_buttom.dart';
import 'package:pop_app/model/backend.dart';
import 'package:pop_app/features/login/presentation/widgets/signup.dart';
import 'package:pop_app/core/widgets/text_labal.dart';
//import 'package:my_app/features/HomePage/presentation/HomePage.dart';
import 'package:pop_app/features/login/presentation/widgets/signup.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_buttom.dart';
import '../../../HomePage/presentation/HomePage.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  // GlobalKey<ScaffoldState> snackkey = GlobalKey<ScaffoldState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  var appcontroller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: snackkey,
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
                const SizedBox(
                  height: 80,
                  child: Text(""),
                ),
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
                  height: 5,
                ),
                const SizedBox(height: 20),
                signinandsignup(
                  context,
                  true,
                  () {
                    auth(
                      _emailTextController, _passwordTextController,
                      //snackkey
                    );
                  },
                ),
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
            Get.to(() => SignUpScreen(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 500));
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

void auth(emailTextController, passwordTextController) async {
  try {
    var userID = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailTextController.text,
      password: passwordTextController.text,
    );
    appcontroller.ownerId = userID.user?.uid ?? '';
    appcontroller.readuser();
    Get.to(() => const homepage(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500));
  } on FirebaseAuthException {
    Get.snackbar(
      "ERROR",
      "Please Check Your E-mail And Password And Try Again,Check If You Registred With This E-mail",
      icon: const Icon(Icons.close, size: 40, color: Colors.white),
      maxWidth: double.infinity,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color.fromARGB(191, 124, 8, 0),
      colorText: Colors.white,
    );
  }
}
