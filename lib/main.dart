import 'package:flutter/material.dart';
import 'package:pop_app/core/widgets/const.dart';
import 'package:pop_app/features/HomePage/presentation/HomePage.dart';
import 'package:pop_app/features/splash/presentation/splash_view.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return   GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(true, context),
      home: SplashView(
        
      ),
    );
    
  }
}
void _createData() {
  final databaseReference = FirebaseDatabase.instance.ref();
  databaseReference.child("flutterDevsTeam1").set({
    'name': 'Deepak Nishad',
    'description': 'Team Lead'
    
  });
   
  }

