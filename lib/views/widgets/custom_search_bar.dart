import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search "Punjabi Lyrics"',
                hintStyle: TextStyle(color: Color(0xFF61616B)),
                prefixIcon: Icon(Icons.search, color: Colors.white, size: 25),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 1,
                      height: 24,
                      color: Color(0xFF45454F),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(Icons.mic, color: Colors.white, size: 25),
                    ),
                  ],
                ),
                filled: true,
                fillColor: Color(0xFF2F2F39),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFEADDFF),
            child: SvgPicture.asset(
              'assets/icons/profile.svg',
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
