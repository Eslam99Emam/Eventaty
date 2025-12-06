import 'package:eventaty/view_models/auth_view_model.dart';
import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_form_title.dart';
import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_header.dart';
import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_input.dart';
import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_login_and_register_button.dart';
import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_login_register_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister(BuildContext context, AuthViewModel authVM) async {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    final success = await authVM.signUp(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );

    if (success && mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (mounted && authVM.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authVM.errorMessage!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EFFA),
      body: Consumer<AuthViewModel>(
        builder: (context, authVM, _) {
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Eventaty Title
                    const CustomHeader(),
            
                    const SizedBox(height: 30),
            
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Form Title
                          const CustomFormTitle(title: "Create A New Account?"),
            
                          const SizedBox(height: 30),
            
                          // Name Section
                          CustomInput(
                            title: "Name",
                            hintText: "John Doe",
                            isPassword: false,
                            controller: _nameController,
                          ),
            
                          const SizedBox(height: 15),
            
                          // Email Input
                          CustomInput(
                            title: "Email",
                            hintText: "johndoe@gmail.com",
                            isPassword: false,
                            controller: _emailController,
                          ),
            
                          const SizedBox(height: 15),
            
                          // Password Section
                          CustomInput(
                            title: "Password",
                            hintText: "..........",
                            isPassword: true,
                            controller: _passwordController,
                          ),
            
                          const SizedBox(height: 15),
            
                          // Confirm Password Section
                          CustomInput(
                            title: "Confirm Password",
                            hintText: "..........",
                            isPassword: true,
                            controller: _confirmPasswordController,
                          ),
            
                          const SizedBox(height: 15),
            
                          // Error Message Display
                          if (authVM.errorMessage != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Text(
                                authVM.errorMessage!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
            
                          const SizedBox(height: 17),
            
                          // Register Button
                          GestureDetector(
                            onTap: authVM.isLoading
                                ? null
                                : () => _handleRegister(context, authVM),
                            child: CustomLoginAndRegisterButton(
                              title: authVM.isLoading ? "Registering..." : "Register",
                            ),
                          ),
            
                          const SizedBox(height: 15),
            
                          const CustomLoginRegisterSwitch(
                            title: "Already Have Account?",
                            navTo: "/login",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}