import 'package:flutter/material.dart';
import 'package:flutterexamproject/app/home_page.dart';
import 'package:flutterexamproject/for_login/singin.dart';
import 'package:flutterexamproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final _userModel=Provider.of<UserModel>(context);

    if(_userModel.state==ViewState.Idle){

      if(_userModel.user==null){
        return SingInPage();
      }
      else{
        return HomePage();
      }

    }
    else{
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(backgroundColor: Colors.red,),
        ),
      );
    }

  }

}
