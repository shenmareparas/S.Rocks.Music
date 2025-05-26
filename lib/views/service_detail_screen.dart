import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceTitle;

  const ServiceDetailScreen({super.key, required this.serviceTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(serviceTitle), backgroundColor: Colors.black),
      body: Center(
        child: Text(
          'You tapped on: $serviceTitle',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
