import 'package:flutterexamproject/repository/user_repository.dart';
import 'package:flutterexamproject/services/fake_aut_service.dart';
import 'package:flutterexamproject/services/firebase_aut_service.dart';
import 'package:flutterexamproject/services/firestore_db_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator=GetIt();

void setuploacator(){
    locator.registerLazySingleton(()=>FirebaseAutService());
    locator.registerLazySingleton(()=>FakeAuthenticationService());
    locator.registerLazySingleton(()=> UserRepository());
    locator.registerLazySingleton(()=>FireStoreDbService());

}