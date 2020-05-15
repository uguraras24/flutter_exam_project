import 'package:flutter/material.dart';
import 'package:flutterexamproject/model/exams.dart';
import 'package:flutterexamproject/model/sweepStakeUser.dart';
import 'package:flutterexamproject/model/user.dart';
import 'package:flutterexamproject/services/aut_base.dart';
import 'package:flutterexamproject/services/fake_aut_service.dart';
import 'package:flutterexamproject/services/firebase_aut_service.dart';
import 'package:flutterexamproject/interfacepages/locator.dart';
import 'package:flutterexamproject/services/firestore_db_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAutService _firebaseAutService = locator<FirebaseAutService>();
  FakeAuthenticationService _fakeAuthenticationService =
  locator<FakeAuthenticationService>();
  FireStoreDbService _firestoreAutService = locator<FireStoreDbService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<User> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.currentUser();
    } else {
      User _user = await _firebaseAutService.currentUser();
      if (_user != null)
        return await _firestoreAutService.readUser(_user.userID);
      else
        return null;
    }
  }

  @override
  Future<User> singInAnonymously() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.singInAnonymously();
    } else {
      return await _firebaseAutService.singInAnonymously();
    }
  }

  @override
  Future<bool> singOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.singOut();
    } else {
      return await _firebaseAutService.singOut();
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithGoogle();
    } else {
      User _user = await _firebaseAutService.signInWithGoogle();
      if (_user != null) {
        bool _sonuc = await _firestoreAutService.saveUser(_user);
        if (_sonuc) {
          return await _firestoreAutService.readUser(_user.userID);
        } else {
          await _firebaseAutService
            ..singOut();
          return null;
        }
      } else
        return null;
    }
  }

  @override
  Future<User> createUserWithEmailAndPasswod(String email,
      String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.createUserWithEmailAndPasswod(
          email, password);
    } else {
      debugPrint(email + password);
      User _user = await _firebaseAutService.createUserWithEmailAndPasswod(
          email, password);
      bool _result = await _firestoreAutService.saveUser(_user);
      if (_result) {
        return await _firestoreAutService.readUser(_user.userID);
      } else {
        return null;
      }
    }
  }

  @override
  Future<User> signInWithEmailAndPasswod(String email, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithEmailAndPasswod(
          email, password);
    } else {
      User _user =
      await _firebaseAutService.signInWithEmailAndPasswod(email, password);

      return await _firestoreAutService.readUser(_user.userID);
    }
  }

  Future<bool> updateUserName(String userId, String newUserName) async {
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {
      return await _firestoreAutService.updateUserName(userId, newUserName);
    }
  }

  Future<List<User>> getAllUser() async {
    if (appMode == AppMode.DEBUG) {
      return [];
    } else {
      var allUserList = await _firestoreAutService.getAllUsers();
      return allUserList;
    }
  }

  Future<List<SweepStakeUser>> getSweepStakeUser() async {
    if (appMode == AppMode.DEBUG) {
      return [];
    } else {
      var allUserList = await _firestoreAutService.getSweepStakeUsers();
      return allUserList;
    }
  }

  @override
  Future<void> forgetPassword(String email) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.forgetPassword(email);
    } else {
      return await _firebaseAutService.forgetPassword(email);
    }
  }

  @override
  Future<bool> controlEmail(String mail, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.controlEmail(mail, password);
    } else {
      return await _firebaseAutService.controlEmail(mail, password);
    }
  }

  @override
  Future<List<Exams>> readExamInfo() async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      return await _firestoreAutService.readExam();
    }
  }


/*Future<bool> updateUserName(String userID, int examcoin) async {
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {
      return await _firestoreAutService.updateUserName(userID, examcoin);
    }
  }*/
}