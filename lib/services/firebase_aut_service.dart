import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterexamproject/model/user.dart';
import 'package:flutterexamproject/services/aut_base.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAutService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> currentUser() async {

    FirebaseUser user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);

  }

  User _userFromFirebase(FirebaseUser user) {

    if (user == null)
      return null;
    return User(userID: user.uid,email:user.email);
  }

  @override
  Future<User> singInAnonymously() async {

    AuthResult sonuc = await FirebaseAuth.instance.signInAnonymously();
    print("Oturum açan id" + sonuc.user.uid.toString());
    return _userFromFirebase(sonuc.user);

  }

  @override
  Future<bool> singOut() async {

    final _googleSingIn = GoogleSignIn();
    await _googleSingIn.signOut();
    await _firebaseAuth.signOut();
    return true;

  }

  @override
  Future<User> signInWithGoogle() async {
    GoogleSignIn _googleSingIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSingIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        AuthResult sonuc = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken)
        );
        FirebaseUser _user = sonuc.user;
        return _userFromFirebase(_user);
      }else {
        return null;
      }
    }
    else {
      return null;
    }
  }
  @override
  Future<User> createUserWithEmailAndPasswod(String email, String password) async{

    debugPrint(email+password);
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if(result!=null){
      result.user.sendEmailVerification();
    }
    return _userFromFirebase(result.user);
  }

  @override
  Future<User> signInWithEmailAndPasswod(String email, String password) async {

    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    print(result.user.isEmailVerified);
    return _userFromFirebase(result.user);



  }

  @override
  Future<void> forgetPassword(String email) {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<bool> controlEmail(String mail,String password)async {
    bool results2;
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: mail, password: password).then((account)async{
      results2=  account.user.isEmailVerified;
    });
    return results2;
  }


}