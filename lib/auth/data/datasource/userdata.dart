import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserData {
  Future<void> registreUser(
      {required String email, required String password, String? name});
  Future<void> loginUser({required String email, required String password});
}

class UserDataFireBase implements UserData {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  UserDataFireBase(this.firebaseAuth, this.firestore);

  @override
  Future<void> loginUser(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> registreUser(
      {required String email, required String password, String? name}) async {
    final List list = [];
    final UserCredential credential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    final userDb = firestore.collection('users');
    await userDb.doc(credential.user!.uid).set({
      'name': name ?? '',
      'email': email,
      'uid': credential.user!.uid,
      'password': password,
      'following': list,
      'followers': list,
      'posts': list,
      'profilePic': '',
      'bio': '',
    });
  }
}
