import 'package:flutter/material.dart';
import 'package:pop_app/features/intro/presentation/widgets/page_view_item.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody({super.key, this.pageController});
final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:pageController,
      children: const [
        PageViewitem(
          image: 'assets/images/intro1.png',
          title: 'Create A TicKet',
          subtitle: 'An App That connects you with other people!',
        ),
        PageViewitem(
          image: 'assets/images/intro2.png',
          title: 'Games',
          subtitle: 'Your Most beloved games avalabilty is a top prioroty!',
        ),
        PageViewitem(
          image: 'assets/images/intro3.png',
          title: 'Chat With poeple who have the same intrests as you!',
          subtitle: 'You can chat with the owner of the post to play with him and make friends',
        )
      ],
    );
  }
}