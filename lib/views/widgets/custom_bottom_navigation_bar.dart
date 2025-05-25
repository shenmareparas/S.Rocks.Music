import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      backgroundColor: Color(0xFF18171C),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFF61616B),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 4, top: 13),
            child: Image.asset(
              'assets/icons/home.png',
              width: 23,
              height: 23,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          ),
          label: 'Home',
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 4, top: 13),
            child: SvgPicture.asset(
              'assets/icons/news.svg',
              width: 23,
              height: 23,
            ),
          ),
          label: 'News',
          tooltip: 'News',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 4, top: 13),
            child: SvgPicture.asset(
              'assets/icons/trackbox.svg',
              width: 23,
              height: 23,
            ),
          ),
          label: 'TrackBox',
          tooltip: 'TrackBox',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 4, top: 13),
            child: SvgPicture.asset(
              'assets/icons/projects.svg',
              width: 23,
              height: 23,
            ),
          ),
          label: 'Projects',
          tooltip: 'Projects',
        ),
      ],
    );
  }
}