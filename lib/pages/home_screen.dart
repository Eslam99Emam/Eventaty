import 'package:eventaty/widgets/HomeWidgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Drawer with Filters
      drawer: Drawer(
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
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.sports_soccer),
                  title: const Text("Sports"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.movie),
                  title: const Text("Entertainment"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      // Main Body
      body: SingleChildScrollView(
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

              const Text(
                "Hello, Mark!",
                style: TextStyle(
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

              const CustomCard(
                imgPath: "assets/cinema.jpg",
                day: "15",
                month: "Nov",
              ),

              const SizedBox(height: 20),

              const CustomCard(
                imgPath: "assets/sports.jpg",
                day: "12",
                month: "Dec",
              ),

              const SizedBox(height: 20),

              const CustomCard(
                imgPath: "assets/cinema.jpg",
                day: "15",
                month: "Nov",
              ),

              const SizedBox(height: 20),

              const CustomCard(
                imgPath: "assets/sports.jpg",
                day: "12",
                month: "Dec",
              ),
            ],
          ),
        ),
      ),
    );
  }
}