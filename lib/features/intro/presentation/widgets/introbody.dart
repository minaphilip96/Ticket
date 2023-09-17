import 'package:flutter/material.dart';
import 'package:pop_app/core/utils/size_config.dart';
import 'package:pop_app/core/widgets/custom_buttom.dart';
import 'package:pop_app/features/intro/presentation/widgets/dots.dart';
import 'package:pop_app/features/intro/presentation/widgets/page_view.dart';
import 'package:pop_app/features/login/presentation/login_view.dart';
import 'package:get/get.dart';


class introbody extends StatefulWidget {
  const introbody({super.key});

  @override
  _introbody createState() => _introbody();
}

class _introbody extends State<introbody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
       children: [
        PageViewBody(pageController: pageController,),
        Positioned(
          left: 0,
          right: 0,
          bottom: SizeConfig.defaultSize!*20,
          child: CustomIndicator(dotIndex: pageController!.hasClients? pageController?.page:0),
        ),
        Visibility(
        visible: pageController!.hasClients ? pageController?.page == 2 ? false : true : true,
          child: Positioned(
          top: SizeConfig.defaultSize! *10,
          right: 32,
          child: Skip(onTap: () {
            if (pageController!.page! < 2){
              Get.to(()=> const LoginView(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));
            }
          },)
        ),
        ),
        Positioned(
          left: SizeConfig.defaultSize! * 10,
          right: SizeConfig.defaultSize! * 10,
          bottom: SizeConfig.defaultSize! * 10,
          child:  CustomGeneralButton(
            onTap: (){
              if (pageController!.page! < 2 ){
                pageController?.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
              }
              else{
                Get.to(()=> const LoginView(),transition:Transition.rightToLeft,duration: const Duration(milliseconds: 500));
              }
            },
            text: pageController!.hasClients ? (pageController?.page == 2 ?"Let's Play":"Next"):'Next'),
          ),
          
       ],
       );
  }
}