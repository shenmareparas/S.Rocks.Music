import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF61616B), width: 1.0)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF18171C),
          showUnselectedLabels: true,
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
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
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
        ),
      ),
    );
  }
}