import 'package:eventaty/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpDataSource {
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return await supabase.auth.signUp(
      data: {
        'name': name,
        'isAdmin': false
      },
      email: email,
      password: password,
    );
  }
}