import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User{

  final String userID;
  String email;
  String userName;
  String profilURL;
  DateTime createdAt;
  DateTime updatedAt;
  int examCoin;
  int programCoin;

  User({@required this.userID,@required this.email});

  Map<String,dynamic> toMap(){
    return{
      'userID' : userID,
      'email'  : email,
      'userName'  : userName ?? email.substring(0,email.indexOf('@'))+"_"+createRandomNumber(),
      'profilURL'  : profilURL,
      'examCoin'  : examCoin ,
      'programCoin'  : programCoin ,
      'createdAt'  : createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt'  : updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  User.fromMap(Map<String,dynamic>map):
        userID=map['userID'],
        email=map['email'],
        userName=map['userName'],
        profilURL=map['profilURL'],
        examCoin=map['examCoin'],
        programCoin=map['programCoin'],
        createdAt=(map['createdAt'] as Timestamp).toDate(),
        updatedAt=(map['updatedAt']as Timestamp).toDate();


  @override
  String toString() {
    return 'User{userID: $userID, email: $email, userName: $userName, profilURL: $profilURL, createdAt: $createdAt, updatedAt: $updatedAt, examCoin: $examCoin, programCoin: $programCoin}';
  }
  String createRandomNumber(){
    int randomnumber=Random().nextInt(999999);
    return randomnumber.toString();
  }


}