import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/size_config.dart';


  

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key, this.text, this.onTap});
  final String? text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
      return GestureDetector( 
      onTap: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          )
          ),
        ),
      );
  }
}

class Skip extends StatelessWidget {
  const Skip({super.key, this.onTap});
 final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: onTap,
      child: const Text(
            'Skip',
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 16,
              color: kMainColor,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.left
          ),
  );
  }
}




Container signinandsignup(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin?'LOG IN':'SIGN UP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}