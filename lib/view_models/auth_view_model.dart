import 'dart:developer';

import 'package:eventaty/models/user_model.dart';
import 'package:eventaty/repos/sign_up_repo.dart';
import 'package:eventaty/services/sign_up.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel extends ChangeNotifier {

  // State variables
  UserModel? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isLoggedIn = false;

  // Getters
  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;


  /// Sign up a new user
  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserModel user = UserModel(
        name: name,
        email: email,
        password: password, 
        isAdmin: false,
      );
      log("${result}");
      SignUpDataSource _authDataSource = SignUpDataSource();
      SignUpRepo signUpRepo = SignUpRepo(data_source: _authDataSource);

      final result = await signUpRepo.call(
        user: user,
      );
      log("${result}");
      if (result.user != null) {
        _currentUser = UserModel(
          id: result.user!.id,
          name: name,
          email: email,
          password: password, 
          isAdmin: false,
        );
        _isLoggedIn = true;
      } 
    } 
    catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
    return _isLoggedIn;
  }
}