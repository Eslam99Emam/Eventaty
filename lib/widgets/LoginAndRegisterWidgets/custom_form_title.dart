import 'package:flutter/material.dart';

class CustomFormTitle extends StatelessWidget {
  final String title;

  const CustomFormTitle(
    {
      super.key,
      required this.title,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}