import 'package:firebase_auth/firebase_auth.dart';
import '../screens/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create firebase user
  UserClass? _userFromFirebaseUser(User? user){
    return user != null ? UserClass(uid: user.uid): null;
  }

  Stream<UserClass?> get user{
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signout() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print("cannot sign out");
      return null;
    }
  }

}