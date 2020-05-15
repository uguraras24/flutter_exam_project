import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterexamproject/for_login/singin.dart';
import 'package:flutterexamproject/my_style_widget/platform_alertdialog.dart';
import 'package:flutterexamproject/viewmodel/usermodel.dart';
import '../my_style_widget/exception.dart';
import '../my_style_widget/login_text_box.dart';
import '../my_style_widget/social_login_button.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';

class SingUpMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingUpPage(),
    );
  }
}

class SingUpPage extends StatefulWidget {
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  String _email, _user_password, user_name;
  final _formKey = GlobalKey<FormState>();

  void _homepage(BuildContext context) async {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => SingInPage()),
    );
  }

  _formSubmit() async {
    try {
      _formKey.currentState.save();
      debugPrint(_email + _user_password);
      final _userModel = Provider.of<UserModel>(context);
      User _user = await _userModel.createUserWithEmailAndPasswod(
          _email, _user_password);
      if (_userModel.state == ViewState.Idle) {
        if (_userModel.user != null) {
          print("KAYIT OLMA İŞLEMİ BAŞARILI" + _user.userID.toString());
          await _userModel.singOut();
          _homepage(context);
        }
      } else {
        print("KAYIT OLMA İŞLEMİ hatalı" + _user.userID.toString());
        return CircularProgressIndicator();
      }
    } on PlatformException catch (e) {
      debugPrint(
          "Witget Hata yakalandı0" + Exceptions.show(e.code)
      );

      showDialog(
          context: context,
          builder: (context) {
            return PlatformAlertDialog(
              alert_title: "E posta veya Şifre Hatalı",
              alert_content: Exceptions.show(e.code),
              main_button_text: "TAMAM",
              cancel_button_text: null,
            );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _userModel.state == ViewState.Idle
          ? Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: ImageArea(),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  LoginTextBoX(
                    label_text: 'E-POSTA',
                    text_color: Colors.grey,
                    underline_text_color: Colors.red,
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    obscureText: false,
                    onSaved: (String mail) {
                      _email = mail;
                    },
                  ), //eposta
                  SizedBox(
                    height: 20.0,
                  ),
                  LoginTextBoX(
                    label_text: 'ŞİFRE',
                    text_color: Colors.grey,
                    underline_text_color: Colors.red,
                    inputType: TextInputType.number,
                    inputAction: TextInputAction.done,
                    obscureText: true,
                    onSaved: (String password) {
                      _user_password = password;
                    },
                  ), //şifre
                  SizedBox(
                    height: 120.0,
                  ),
                  SocialLoginButton(
                    button_text: "KAYIT OL",
                    button_color: Colors.red,
                    button_text_color: Colors.white,
                    button_radius: 20,
                    button_height: 40,
                    onPressed: () => _formSubmit(),
                  ),
                  //buton
                ],
              ),
            ),
          ],
        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      ));
  }

  Stack ImageArea() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(25.0, 105.0, 0.0, 0.0),
          child: Image.asset('assets/image_01.png'),
        ), //logo
        Container(
          padding: EdgeInsets.fromLTRB(185.0, 105.0, 0.0, 0.0),
          child: Text(
            '   HADİ ',
            style: TextStyle(
              color: (Colors.red),
              fontSize: 43.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(155.0, 175.0, 0.0, 0.0),
          child: Text(
            'BAŞLAYALIM ',
            style: TextStyle(
              color: (Colors.red),
              fontSize: 33.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ), //resimalanı
      ],
    );
  }
}
