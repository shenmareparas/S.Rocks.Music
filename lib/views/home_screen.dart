import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search "Punjabi Lyrics"',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 25,
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 1,
                              height: 24,
                              color: Color(0xFF45454F),
                              margin: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            Icon(Icons.mic, color: Colors.white, size: 25),
                          ],
                        ),
                        filled: true,
                        fillColor: Colors.grey[900],
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
                    'FREE DEMO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
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
        showUnselectedLabels: true,
        backgroundColor: Color(0xFF18171C),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF61616B),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
              width: 23,
              height: 23,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/news.svg'),
            label: 'News',
            tooltip: 'News',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/trackbox.svg'),
            label: 'TrackBox',
            tooltip: 'TrackBox',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/projects.svg'),
            label: 'Projects',
            tooltip: 'Projects',
          ),
        ],
      ),
    );
  }
}
