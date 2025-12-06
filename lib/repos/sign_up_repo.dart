import 'package:eventaty/models/user_model.dart';
import 'package:eventaty/services/sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpRepo {
  final SignUpDataSource data_source;
  SignUpRepo(
    {required this.data_source}
  );
  Future<AuthResponse> call({required UserModel user}) async {
    return await data_source.signUp(
      name: user.name,
      email: user.email,
      password: user.password
    );
  }
}