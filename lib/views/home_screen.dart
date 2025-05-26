import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/service_viewmodel.dart';
import 'widgets/service_card.dart';
import 'widgets/custom_search_bar.dart';
import 'widgets/banner_section.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ServiceViewModel>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              // Search Bar
              CustomSearchBar(),
              // Banner
              BannerSection(),
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
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}