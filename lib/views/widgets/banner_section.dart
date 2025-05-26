import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Claim your',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Free Demo',
              style: TextStyle(
                fontFamily: 'Lobster',
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'for custom Music Production',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'Book Now',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        Positioned(
          left: -130,
          bottom: -30,
          child: SvgPicture.asset(
            'assets/icons/cd.svg',
            height: 121,
            width: 121,
          ),
        ),
        Positioned(
          right: -145,
          bottom: -30,
          child: SvgPicture.asset(
            'assets/icons/piano.svg',
            height: 135,
            width: 135,
          ),
        ),
      ],
    );
  }
}
