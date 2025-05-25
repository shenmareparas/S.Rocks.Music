import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF8B2635),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
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
          SizedBox(height: 13),
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
          SizedBox(height: 20),
          Text(
            'for custom Music Production',
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
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
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}