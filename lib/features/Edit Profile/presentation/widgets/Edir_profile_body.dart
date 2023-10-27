import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/widgets/custom_buttom.dart';
import 'package:pop_app/core/widgets/text_labal.dart';
import 'package:pop_app/features/HomePage/presentation/HomePage.dart';

class Edit_profile_body extends StatefulWidget {
  const Edit_profile_body({super.key});

  @override
  State<Edit_profile_body> createState() => _Edit_profile_bodyState();
}

class _Edit_profile_bodyState extends State<Edit_profile_body> {
    final TextEditingController _bioTextController = TextEditingController();
    final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.purple[300],
      body: Column(
        children: [
          SizedBox(height: 50,),
          Image.asset(kLogo,width: 300,),
          SizedBox(height: 70,width: 30,),
          reusableTextField(
            'Edit Bio', Icons.assignment_sharp,false,_bioTextController),
             SizedBox(height: 20),
             reusableTextField(
            'Edit Email', Icons.email,false,_emailTextController),
            Container(
              padding: EdgeInsets.all(10),
                width: 100,
              child: CustomGeneralButton(text: 'Submit',onTap:() {
            Get.to(()=> homepage(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));

            },)
            ),


            
        ],
      ),
    );
  }
}