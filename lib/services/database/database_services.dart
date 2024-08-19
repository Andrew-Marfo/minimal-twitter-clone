import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_clone/models/user_model.dart';

class DatabaseServices {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> saveUserInfoToFirebase(
    String email,
    String name,
    String username,
  ) async {
    String userUid = _auth.currentUser!.uid;

    // create user
    UserProfile user = UserProfile(
      uid: userUid,
      name: name,
      email: email,
      username: username,
      bio: '',
    );

    final userMap = user.toMap();
    await _db.collection('users').doc(userUid).set(userMap);
  }

  
}
