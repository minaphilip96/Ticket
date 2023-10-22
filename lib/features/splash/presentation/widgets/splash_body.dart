import 'package:flutter/material.dart';
import 'package:pop_app/core/utils/size_config.dart';
import 'package:pop_app/features/HomePage/presentation/HomePage.dart';
import 'package:pop_app/features/intro/presentation/intro.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class Splashbody extends StatefulWidget {
  const Splashbody({super.key});
 
  @override
  _SplashbodyState createState() => _SplashbodyState();
  }
  
  class _SplashbodyState extends State<Splashbody> with SingleTickerProviderStateMixin {
  late AnimationController animationController; 
  late Animation<double> fading ;

  @override
  void initState() {
    super.initState();
    animationController=AnimationController(vsync: this,duration:const Duration(milliseconds: 700));
    fading=Tween<double>(begin:0.3 ,end:1).animate(animationController);
    animationController.repeat(reverse:true);
    getvaildationData().whenComplete(()async{
    gettointro();

    });
  }
    @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future getvaildationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail=obtainedEmail;
    });
    print(finalEmail);
    print(obtainedEmail);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child:  Column(
        mainAxisAlignment :MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/SplashView.png'),
          FadeTransition(opacity: fading,
          child:const Text("TicKet",
          style: TextStyle(
            fontFamily: "Valorax",
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
           ),
          ),

        ],
      ),
    );
  }
  }
void gettointro(){
  Future.delayed(const Duration(seconds: 2),(){
    Get.to(finalEmail== null ? ()=> intro() : homepage()  ,transition: Transition.leftToRight);
	    });
  }
