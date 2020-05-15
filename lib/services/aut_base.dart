import 'package:flutterexamproject/model/user.dart';

abstract class AuthBase{
  Future<User> currentUser();
  Future<User> singInAnonymously();
  Future<bool> singOut();
  Future<User> signInWithGoogle();
  Future<User> signInWithEmailAndPasswod(String email,String password);
  Future<User> createUserWithEmailAndPasswod(String email,String password);
  Future<void> forgetPassword(String email);
  Future<bool> controlEmail(String user,String password);



}