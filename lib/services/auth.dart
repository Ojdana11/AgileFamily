import 'package:firebase_auth/firebase_auth.dart';
import 'package:agile_family/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  LightUser _createUserFromUserCredential(User user){
    return user != null ? LightUser(uid: user.uid) : null;
  }

  Stream<LightUser> get user {
    return _auth
        .authStateChanges()
        .map(_createUserFromUserCredential);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return _createUserFromUserCredential(result.user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _createUserFromUserCredential(result.user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _createUserFromUserCredential(result.user);
    } catch(e){
        print(e.toString());
        return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}