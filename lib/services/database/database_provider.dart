import 'package:flutter/material.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/services/auth/auth_services.dart';
import 'package:twitter_clone/services/database/database_services.dart';

class DatabaseProvider extends ChangeNotifier {
  final _auth = AuthServices();
  final _db = DatabaseServices();

  Future<UserProfile?> userProfile(String uid) {
    return _db.getUserFromFirebase(uid);
  }

  Future<void> updateUserBio(String bio) {
    return _db.updateUserBioInFirebase(bio);
  }
}
