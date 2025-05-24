import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/service_viewmodel.dart';
import 'widgets/service_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ServiceViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search "Punjabi Lyrics"',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: Icon(Icons.mic, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Banner
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF8B2635),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center-align all elements
                children: [
                  Text(
                    'Claim your',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Ensure text is centered
                  ),
                  SizedBox(height: 13),
                  Text(
                    'FREE DEMO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Ensure text is centered
                  ),
                  SizedBox(height: 20),
                  Text(
                    'for custom Music Production',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center, // Ensure text is centered
                  ),
                  SizedBox(height: 16), // Space between text and button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Book Now'),
                  ),
                ],
              ),
            ),
            // Services Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Hire hand-picked Pros for popular music services',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Expanded(
              child: viewModel.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : viewModel.error != null
                  ? Center(child: Text('Error: ${viewModel.error}'))
                  : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: viewModel.services.length,
                itemBuilder: (context, index) {
                  final service = viewModel.services[index];
                  return ServiceCard(service: service);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note), label: 'TrackBox'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Projects'),
        ],
      ),
    );
  }
}