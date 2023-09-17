import 'package:flutter/material.dart';
import 'package:pop_app/core/utils/size_config.dart';
import 'package:pop_app/features/intro/presentation/intro.dart';
import 'package:get/get.dart';

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
    gettointro();
  }
    @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child:  Column(
        mainAxisAlignment :MainAxisAlignment.center,
        children: [
          const Spacer(),
          FadeTransition(opacity: fading,
          child:const Text("Gamers Area",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
           ),
          ),
          Image.asset('assets/images/SplashView.png')
        ],
      ),
    );
  }
  }
void gettointro(){
  Future.delayed(const Duration(seconds: 2),(){
    Get.to(()=>const intro(),transition: Transition.leftToRight);
    });
  }
