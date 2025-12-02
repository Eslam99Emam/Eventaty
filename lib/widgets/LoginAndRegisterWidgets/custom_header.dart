import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {              
    return  Text(
      "Eventaty",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: Color(0xFF3177F0),
      ),
    );
  }
}