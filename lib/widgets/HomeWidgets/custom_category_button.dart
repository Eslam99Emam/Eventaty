import 'package:flutter/material.dart';

class CustomCategoryButton extends StatelessWidget {
  final String label;
  final double opacity;

  const CustomCategoryButton(
    {
      super.key,
      required this.label,
      required this.opacity,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 150, 243, opacity),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}