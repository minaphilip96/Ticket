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
          title: 'Open A TicKet',
          subtitle: 'A Feature That Allows You To Talk To The Owner Of The Post',
        ),
        PageViewitem(
          image: 'assets/images/intro2.png',
          title: 'Games',
          subtitle: 'The Most Popular games are available on the application',
        ),
        PageViewitem(
          image: 'assets/images/intro3.png',
          title: 'Chat With Your Friend',
          subtitle: 'You can chat with the owner of the post to play with him and make friends',
        )
      ],
    );
  }
}