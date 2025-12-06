// import 'package:eventaty/view_models/auth_view_model.dart';
// import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_form_title.dart';
// import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_header.dart';
// import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_input.dart';
// import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_login_and_register_button.dart';
// import 'package:eventaty/widgets/LoginAndRegisterWidgets/custom_login_register_switch.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   late TextEditingController _identifierController;
//   late TextEditingController _passwordController;

//   @override
//   void initState() {
//     super.initState();
//     _identifierController = TextEditingController();
//     _passwordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _identifierController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _handleLogin(BuildContext context, AuthViewModel authVM) async {
//     if (_identifierController.text.isEmpty || _passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill in all fields')),
//       );
//       return;
//     }

//     final success = await authVM.signIn(
//       identifier: _identifierController.text,
//       password: _passwordController.text,
//     );

//     if (success && mounted) {
//       Navigator.pushReplacementNamed(context, '/home');
//     } else if (mounted && authVM.errorMessage != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(authVM.errorMessage!)),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE9EFFA),
//       body: Consumer<AuthViewModel>(
//         builder: (context, authVM, _) {
//           return SafeArea(
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Eventaty Title
//                     const CustomHeader(),
            
//                     const SizedBox(height: 30),
            
//                     // Form
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 24),
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(35),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Form Title
//                           const CustomFormTitle(title: "Welcome To Eventaty Login Now!!"),
            
//                           const SizedBox(height: 30),
            
//                           // Email/StudentId Input
//                           CustomInput(
//                             title: "Email or Student ID",
//                             hintText: "johndoe@gmail.com",
//                             isPassword: false,
//                             controller: _identifierController,
//                           ),
            
//                           const SizedBox(height: 20),
            
//                           // Password Section
//                           CustomInput(
//                             title: "Password",
//                             hintText: ".............",
//                             isPassword: true,
//                             controller: _passwordController,
//                           ),
            
//                           const SizedBox(height: 20),
            
//                           // Error Message Display
//                           if (authVM.errorMessage != null)
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 15),
//                               child: Text(
//                                 authVM.errorMessage!,
//                                 style: const TextStyle(color: Colors.red),
//                               ),
//                             ),
            
//                           // Login Button
//                           GestureDetector(
//                             onTap: authVM.isLoading
//                                 ? null
//                                 : () => _handleLogin(context, authVM),
//                             child: CustomLoginAndRegisterButton(
//                               title: authVM.isLoading ? "Logging in..." : "Login",
//                             ),
//                           ),
            
//                           const SizedBox(height: 20),
            
//                           const CustomLoginRegisterSwitch(
//                             title: "Don't Have Account?",
//                             navTo: "/register",
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }