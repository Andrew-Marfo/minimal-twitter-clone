import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_clone/models/user_model.dart';

class DatabaseServices {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

// save user info to firebase upon registration
  Future<void> saveUserInfoToFirebase(
    String email,
    String name,
  ) async {
    String userUid = _auth.currentUser!.uid;
    String username = email.split('@')[0];
    // create user
    UserProfile user = UserProfile(
      uid: userUid,
      name: name,
      email: email,
      username: username,
      bio: '',
    );

    final userMap = user.toMap();
    await _db.collection('Users').doc(userUid).set(userMap);
  }

// Get user info
  Future<UserProfile?> getUserFromFirebase(String uid) async {
    try {
      DocumentSnapshot userDoc = await _db.collection('Users').doc(uid).get();
      return UserProfile.fromDocument(userDoc);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
