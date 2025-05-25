import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:developer' as developer;
import '../../models/service.dart';
import '../service_detail_screen.dart';

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ServiceDetailScreen(serviceTitle: service.title),
          ),
        );
      },
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(service.bannerPath),
              fit: BoxFit.cover,
              opacity: 0.1,
              colorFilter: ColorFilter.mode(
                Color(0xFF202126),
                BlendMode.overlay,
              ),
              onError: (exception, stackTrace) {
                developer.log(
                  'Failed to load background image: ${service.bannerPath}',
                  name: 'ServiceCard',
                  error: exception,
                  stackTrace: stackTrace,
                );
              },
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  service.iconPath,
                  width: 46,
                  height: 47,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        service.description,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset('assets/icons/arrow.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
