import 'package:flutterexamproject/model/exams.dart';
import 'package:flutterexamproject/model/sweepStakeUser.dart';
import 'package:flutterexamproject/model/user.dart';

abstract class DBBase{
  Future<bool> saveUser(User user);
  Future<User> readUser(String userID);
  Future<bool> updateUserName(String userID, String newUserName);
  Future<List<User>> getAllUsers();
  Future<List<SweepStakeUser>> getSweepStakeUsers();
  Future<List<Exams>> readExam();
}