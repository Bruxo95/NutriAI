import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final _supabase = Supabase.instance.client;

  Future<User?> signIn(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response.user;
  }

  Future<User?> signUp(String email, String password) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/',
    );
    return response.user;
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  User? getCurrentUser() {
    return _supabase.auth.currentUser;
  }

  Future<bool> hasUserProfile() async {
    final user = getCurrentUser();
    if (user == null) {
      return false;
    }
    final response = await _supabase
        .from('profiles')
        .select('id')
        .eq('id', user.id)
        .maybeSingle();
    return response != null;
  }
}
