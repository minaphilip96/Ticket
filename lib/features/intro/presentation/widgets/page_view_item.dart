import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/size_config.dart';
import 'package:pop_app/core/widgets/space_widget.dart';

class PageViewitem extends StatelessWidget {
  const PageViewitem({super.key, this.image, this.title, this.subtitle});
final String? image;
final String? title;
final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const VerticalSpace(18),
        SizedBox(height:SizeConfig.defaultSize!*30,child:Image.asset(image!)),
        const VerticalSpace(2),
        Text(
          title!,style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: kMainColor,
            fontWeight: FontWeight.w600,),
            textAlign: TextAlign.left,
         ),
         const VerticalSpace(1.5),
         Text(
          subtitle!,
         style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color:Color(0xFF797979),
         ),
         textAlign: TextAlign.left
         )
        ]
    );
  }
}