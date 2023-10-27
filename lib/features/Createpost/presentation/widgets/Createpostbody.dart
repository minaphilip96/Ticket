import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/features/HomePage/presentation/HomePage.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Chat_Body.dart';
import 'package:pop_app/model/backend.dart';
String gameValue="";
var playerValue;
const List<String> list = <String>['Valorant', 'Call of duty', 'League of legends', 'Pubg mobile',"Fifa","Free fire"];
const List<String> numbers = <String>['1', '2', '3', '4','5','6','7','8','9','10'];
 List<String> players = <String>[];

 

class CreatePostBody extends StatefulWidget {
  const CreatePostBody({super.key});

  @override
  State<CreatePostBody> createState() => _CreatePostBodyState();
}

class _CreatePostBodyState extends State<CreatePostBody> {
 String dropdownValue = list.first;
  final TextEditingController _postTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[GestureDetector(onTap: () {
            

        },
        child: Container(
        height: 60,
        width:70,
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: TextButton(
            child: Text('POST',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            onPressed: () => appcontroller.createpost(_postTextController.text, gameValue,playerValue),
            
            )
        ),
        ),
        ),
   
        ],
        title: const Text(
          "Create post",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
    body: Column(
      children:[
        Container(
        height: 150,
        width: 350,
        child: Image.asset(kLogo),),
    Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child:
        TextField(
    controller: _postTextController,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9),
    fontFamily: 'informal',
    fontSize: 12
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.post_add_outlined,
        color: Colors.white70,
      ),
      labelText: 'Write Your Post',
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    maxLines: 5,
    maxLength: 120,
  ),
    ),
    SizedBox(height: 10,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
  Container(
    height: 50,
    child:
DropdownMenu<String>(
  label: const Text('Games',
  style: TextStyle(color:Colors.white ),
  ),
  trailingIcon: const Icon(Icons.games_outlined),
  width: 180,
      initialSelection: list.first,
      onSelected: (String? value) {
        setState(() {
          gameValue = value!;
          select_game(gameValue);
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList()
    ),
  ),
  Container(
    margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
    height: 50,
    child:
DropdownMenu<String>(
  label: const Text('Players',
  style: TextStyle(color:Colors.white ),),
  trailingIcon: const Icon(Icons.people_outline),
  width: 150,
      initialSelection: numbers.first,
      onSelected: (String? value) {
        setState(() {
          playerValue = value!;
          print(players);
        });
      },
      dropdownMenuEntries: players.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList()
    ),
  ),
    ],
  ),
      ],
    ),

    );
  }
}

void select_game(item){
  if (item=='Valorant'){
      players= List.from(numbers.sublist(0,4));
      print(playerValue);
  }
  else if (item=='Call of duty warzone'){
     players= List.from(numbers.sublist(0,3));
  }
  else if (item=='League of legends'){
     players= List.from(numbers.sublist(0,4));
  }
  else if (item=='Pubg mobile'){
     players= List.from(numbers.sublist(0,3));
  }
  else if (item=="Fifa"){
     players= List.from(numbers.sublist(0,4));
  }
  else if (item=='Free fire'){
     players= List.from(numbers.sublist(0,3));
  }
}
