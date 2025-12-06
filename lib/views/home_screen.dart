import 'package:eventaty/view_models/auth_view_model.dart';
import 'package:eventaty/view_models/home_view_model.dart';
import 'package:eventaty/widgets/HomeWidgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Drawer with Filters
      drawer: Consumer<HomeViewModel>(
        builder: (context, homeVM, _) {
          return Drawer(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Filters",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ListTile(
                      leading: const Icon(Icons.circle),
                      title: const Text("All"),
                      onTap: () {
                        homeVM.filterByCategory('All');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.sports_soccer),
                      title: const Text("Sports"),
                      onTap: () {
                        homeVM.filterByCategory('Sports');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.movie),
                      title: const Text("Entertainment"),
                      onTap: () {
                        homeVM.filterByCategory('Entertainment');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.computer),
                      title: const Text("Technology"),
                      onTap: () {
                        homeVM.filterByCategory('Technology');
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Logout"),
                      onTap: () {
                        Navigator.pop(context);
                        _showLogoutConfirmation(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // Main Body
      body: Consumer2<HomeViewModel, AuthViewModel>(
        builder: (context, homeVM, authVM, _) {
          final userName = authVM.currentUser?.name ?? 'Guest';
          
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drawer Icon using Builder
                  Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: const Icon(Icons.menu, size: 35),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Hello, $userName!",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Have a nice day",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Display filtered events
                  if (homeVM.filteredEvents.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('No events found'),
                      ),
                    )
                  else
                    ...homeVM.filteredEvents.map((event) {
                      return Column(
                        children: [
                          CustomCard(
                            imgPath: event.imagePath,
                            day: event.day,
                            month: event.month,
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}