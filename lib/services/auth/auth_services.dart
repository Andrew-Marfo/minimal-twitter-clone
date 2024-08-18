import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  User get user => _auth.currentUser!;

  // Create User account
  createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      return e;
    }
  }

  // Login User In
  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      return e;
    }
  }
}
