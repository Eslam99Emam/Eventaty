import 'package:eventaty/view_models/home_view_model.dart';
import 'package:eventaty/widgets/DetailsWidgets/custom_tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imgPath = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Consumer<HomeViewModel>(
        builder: (context, homeVM, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ================== Top Image Section ==================
                Stack(
                  children: [
                    Container(
                      height: 280,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Image.asset(
                        imgPath,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Back button
                    Positioned(
                      top: 40,
                      left: 15,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),

                    // Event title + tags
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Event Details",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 4,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              CustomTag(title: "15 NOV 10AM–7PM"),
                              const SizedBox(width: 10),
                              CustomTag(title: "ELNASR CITY"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                // ================== Description title ==================
                const Padding(
                  padding: EdgeInsets.only(top: 25, left: 20),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // ================== Description text ==================
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer tincidunt felis at dolor molestie egestas.",
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // ================== Enroll button ==================
                Center(
                  child: Container(
                    width: 300,
                    height: 65,
                    decoration: BoxDecoration(
                      color: const Color(0xff1976ff),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/qr');
                      },
                      child: const Text(
                        "ENROLL NOW!!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}