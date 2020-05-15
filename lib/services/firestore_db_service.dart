import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterexamproject/model/exams.dart';
import 'package:flutterexamproject/model/sweepStakeUser.dart';
import 'package:flutterexamproject/model/user.dart';
import 'package:flutterexamproject/services/db_base.dart';

class FireStoreDbService implements DBBase {
  final Firestore _firebaseDB = Firestore.instance;

  @override
  Future<bool> saveUser(User user) async {
    await _firebaseDB
        .collection("users")
        .document(user.userID)
        .setData(user.toMap());

    DocumentSnapshot _userinfo =
        await Firestore.instance.document("users/${user.userID}").get();

    Map _userinfoMap = _userinfo.data;
    User _userinfoObject = User.fromMap(_userinfoMap);
    print("Bilgiler" + _userinfoObject.toString());

    return true;
  }

  @override
  Future<User> readUser(String userID) async {
    DocumentSnapshot _readuser =
        await _firebaseDB.collection("users").document(userID).get();
    Map<String, dynamic> _readuserinfoMap = _readuser.data;

    User _userinfoobject = User.fromMap(_readuserinfoMap);
    print("Okunan değerler" + _userinfoobject.toString());
    return _userinfoobject;
  }

  @override
  Future<bool> updateUserName(String userID, String newUserName) async {
    var users = await _firebaseDB
        .collection("users")
        .where("userName", isEqualTo: newUserName)
        .getDocuments();
    if (users.documents.length >= 1) {
      return false;
    } else {
      await _firebaseDB
          .collection("users")
          .document(userID)
          .updateData({'userName': newUserName});
      return true;
    }
  }

  @override
  Future<List<User>> getAllUsers() async {
    List<String> winclub = List();
    QuerySnapshot qs = await _firebaseDB
        .collection("sweepstake")
        .where("cekilisId1")
        .getDocuments();

    for (var documents in qs.documents) {
      debugPrint(documents.data.toString());
    }

    return null;
  }

  @override
  Future<List<SweepStakeUser>> getSweepStakeUsers() async {
    QuerySnapshot qs = await _firebaseDB
        .collection("sweepstake")
        .where("cekilisId1")
        .getDocuments();

    List<SweepStakeUser> winclub = [];

    for (DocumentSnapshot user in qs.documents) {
      SweepStakeUser _user = SweepStakeUser.fromMap(user.data);
      winclub.add(_user);
      debugPrint(_user.toString());
    }

    return winclub;
  }

  @override
  Future<List<Exams>> readExam() async {
    List<Exams> examlist = [];
    QuerySnapshot _readexam =
        await _firebaseDB.collection("exams").getDocuments();

    for (DocumentSnapshot documentSnapshot in _readexam.documents) {
      Exams _examinfoobject = Exams.fromMap(documentSnapshot.data);
      examlist.add(_examinfoobject);
      debugPrint(_examinfoobject.toString());
    }

    return examlist;
  }

/*@override
  Future<bool> updateUserName(String userID, int examcoinupdate)  async {
    var users = await _firebaseDB
        .collection("users")
        .where("examcoin", isEqualTo: examcoinupdate)
        .getDocuments();
    if (users.documents.length >= 1) {
      return false;
    } else {
      await _firebaseDB
          .collection("users")
          .document(userID)
          .updateData({'examcoin': examcoinupdate});
      return true;
    }
  }*/

}
