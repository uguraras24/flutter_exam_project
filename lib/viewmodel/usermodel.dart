import 'package:flutter/cupertino.dart';
import 'package:flutterexamproject/interfacepages/locator.dart';
import 'package:flutterexamproject/model/exams.dart';
import 'package:flutterexamproject/model/sweepStakeUser.dart';
import 'package:flutterexamproject/model/user.dart';
import 'package:flutterexamproject/repository/user_repository.dart';
import 'package:flutterexamproject/services/aut_base.dart';

enum ViewState { Idle, Busy }

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  User _user;
  String emailErrorMessage;
  String passwordErrorMessage;

  User get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<User> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      if (_user != null)
        return _user;
      else
        return null;
    } catch (e) {
      debugPrint("View model Currunt User" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> singInAnonymously() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.singInAnonymously();
      return _user;
    } catch (e) {
      debugPrint("View model singAnanoy User" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> singOut() async {
    try {
      state = ViewState.Busy;
      bool sonuc = await _userRepository.singOut();
      _user = null;
      return sonuc;
    } catch (e) {
      debugPrint("View model Currunt User" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      if (_user != null)
        return _user;
      else
        return null;
    } catch (e) {
      debugPrint("SsignInWithGoogle hata" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> createUserWithEmailAndPasswod(
      String email, String password) async {
    if (_emailSifreKontrol(email, password)) {
      try {
        state = ViewState.Busy;
        _user = await _userRepository.createUserWithEmailAndPasswod(
            email, password);
        return _user;
      } finally {
        state = ViewState.Idle;
      }
    } else {
      return null;
    }
  }

  @override
  Future<User> signInWithEmailAndPasswod(String email, String password) async {
    try {
      if (_emailSifreKontrol(email, password)) {
        state = ViewState.Busy;
        _user =
            await _userRepository.signInWithEmailAndPasswod(email, password);
        return _user;
      } else {
    return null;
    }
    } finally {
      state = ViewState.Idle;
    }
  }

  bool _emailSifreKontrol(String email, String sifre) {
    var sonuc = true;
    if (sifre.length < 6) {
      passwordErrorMessage = "En az 6 karakter olmalı";
      sonuc = false;
    } else
      passwordErrorMessage = null;
    if (!email.contains('@')) {
      emailErrorMessage = "Geçersiz email adresi";
      sonuc = false;
    } else
      emailErrorMessage = null;
    return sonuc;
  }

  Future<bool> updateUserName(String userId, String newUserName) async{
   var result= await _userRepository.updateUserName(userId, newUserName);
    return result;
  }

  Future<List<User>> getAllUser()async{
    var AllUserLisr = await _userRepository.getAllUser();
    return AllUserLisr;
  }

  Future<List<SweepStakeUser>> getSweepStakeUser()async{
    var AllUserLisr = await _userRepository.getSweepStakeUser();
    return AllUserLisr;
  }

  @override
  Future<void> forgetPassword(String email) async{
    if(email==null||email==""){
        return false;
    }
    else{
      return await _userRepository.forgetPassword(email);
    }
  }
  @override
  Future<bool> controlEmail(String mail, String password) async{
    return await _userRepository.controlEmail(mail,password);
  }

  @override
  Future<List<Exams>> readExam() async{
      return await _userRepository.readExamInfo();
  }

/* Future<bool> updateUserName(String userID, int examcoinnew) async {
    var sonuc = await _userRepository.updateUserName(userID, examcoinnew);
    if (sonuc) {
      _user.examCoin = examcoinnew;
    }
    return sonuc;
  }*/

  /*Future<String> uploadFile(
      String userID, String fileType, File profilFoto) async {
    var indirmeLinki =
    await _userRepository.uploadFile(userID, fileType, profilFoto);
    return indirmeLinki;
  }*/
}
