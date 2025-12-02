import 'package:flutter/material.dart';

class CustomLoginAndRegisterButton extends StatelessWidget {
  final String title;

  const CustomLoginAndRegisterButton(
    {
      super.key,
      required this.title,
    }
  );

  @override
  Widget build(BuildContext context) {                    
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          backgroundColor: const Color(0xFF3177F0),
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}