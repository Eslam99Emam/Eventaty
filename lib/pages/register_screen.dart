import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_form_title.dart';
import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_header.dart';
import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_input.dart';
import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_login_and_register_button.dart';
import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_login_register_switch.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EFFA),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Eventaty Title 
              CustomHeader(),
          
              const SizedBox(height: 30),
          
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                ),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Form
                    CustomFormTitle(title: "Create A New Account?"),
          
                    const SizedBox(height: 30),
                    
                    // Name Section
                    CustomInput(title: "Name", hintText: "John Doe", isPassword: false,),
          
                    const SizedBox(height: 20),
          
                    // Email Input
                    CustomInput(title: "Email", hintText: "johndoe@gmail.com", isPassword: false,),
          
                    const SizedBox(height: 20),
          
                    // Password Section
                    CustomInput(title: "Password", hintText:"..........", isPassword: true),
          
                    const SizedBox(height: 20),
          
                    // Retype Password Section
                    CustomInput(title: "Retype Password", hintText:"..........", isPassword: true),
          
                    const SizedBox(height: 37),
                    
                    // Register Button
                    CustomLoginAndRegisterButton(title: "Register"),
          
                    const SizedBox(height: 20),
          
                    CustomLoginRegisterSwitch(title: "Already Have Account?", navTo: "/login")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}