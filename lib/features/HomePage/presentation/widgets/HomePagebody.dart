import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/core/utils/data.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Chat.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Friends.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Home.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Notifications.dart';
import 'package:pop_app/features/HomePage/presentation/widgets/Profile.dart';


class HomePagebody extends StatefulWidget {
  const HomePagebody({super.key});


  @override
  State<HomePagebody> createState() => _HomePagebodyState();
}
 
class _HomePagebodyState extends State<HomePagebody> {
   final TextEditingController _post = TextEditingController();
     PageController? _pageController;
      int _page = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Chats(),
          Home(),
          Notifications(),
          Profile(),
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).canvasColor,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.grey[500]),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: kMainColor
          ),
          selectedItemColor: kMainColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
                label:"Chat"
            ),

           

            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
                  label:"Home"
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
                 label:"notifications"
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label:"Profile"
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),

    );
  }

  void navigationTapped(int page) {
    _pageController?.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
