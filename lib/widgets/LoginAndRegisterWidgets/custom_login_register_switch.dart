import 'package:flutter/material.dart';

class CustomLoginRegisterSwitch extends StatelessWidget {
  final String navTo;
  final String title;

  const CustomLoginRegisterSwitch(
    {
      super.key,
      required this.title,
      required this.navTo,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, navTo);
        },
        child: Text(
          title,
          style:
              TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ),
    );
  }
}