import 'package:flutterexamproject/model/user.dart';
import 'package:flutterexamproject/services/aut_base.dart';

class FakeAuthenticationService implements AuthBase{
  
  String userID="121212";
  
  @override
  Future<User> currentUser() async{
    return Future.value(User(userID: userID,email: "sivavim@info.com"));
  }

  @override
  Future<User> singInAnonymously()async {
    return await Future.delayed(Duration(seconds: 2),()=>User(userID: userID,email: "sivavim@info.com"));
  }

  @override
  Future<bool> singOut() {
    return Future.value(true);
  }

  @override
  Future<User> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    return null;
  }

  @override
  Future<User> createUserWithEmailAndPasswod(String email, String password) {
    // TODO: implement createUserWithEmailAndPasswod
    return null;
  }

  @override
  Future<User> signInWithEmailAndPasswod(String email, String password) {
    // TODO: implement signInWithEmailAndPasswod
    return null;
  }

  @override
  Future<void> forgetPassword(String email) {
    // TODO: implement forgetPassword
    return null;
  }
  @override
  Future<bool> controlEmail(String mail,String password)async {
    return null;
  }

}