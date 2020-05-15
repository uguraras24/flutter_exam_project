import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterexamproject/my_style_widget/exception.dart';
import 'package:flutterexamproject/for_login/singup.dart';
import 'package:flutterexamproject/my_style_widget/platform_alertdialog.dart';
import 'package:flutterexamproject/viewmodel/usermodel.dart';
import '../my_style_widget/login_text_box.dart';
import '../my_style_widget/social_login_button.dart';
import 'package:provider/provider.dart';

import '../my_style_widget/social_login_button_with_icon.dart';
import '../model/user.dart';

class SingInMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingInPage(),
    );
  }
}

class SingInPage extends StatefulWidget {
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  String mail, userpassword;
  final _formKey = GlobalKey<FormState>();

  void _singup(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SingUpPage()),
    );
  }
  void _forgotpassword(BuildContext context) async {
    try{
      _formKey.currentState.save();
      final _userModel = Provider.of<UserModel>(context);
      await _userModel.forgetPassword(mail);
      if(mail==null||mail==""){
        debugPrint("mail boşşşş");
        PlatformAlertDialog(
          alert_title: "E posta bulunamadı",
          alert_content: "Lütfen ekranda ki E posta  alanını doldurunuz",
          main_button_text: "TAMAM",
        ).show(context);
      }
      else{
        debugPrint("mail gönderildi");
        PlatformAlertDialog(
          alert_title: "E posta gönderildi",
          alert_content: "Gönderilen mailde ki linke tıklayarak şifrenizi oluşturabilirsiniz",
          main_button_text: "TAMAM",
        ).show(context);
      }
    }
    catch(e){
      PlatformAlertDialog(
        alert_title: "E posta bulunamadı",
        alert_content: "Mail adresinin doğruluğunu kontrol ediniz",
        main_button_text: "TAMAM",
      ).show(context);
    }

  }
  void _loginwithgoogle(BuildContext context) async {
    try {
      _formKey.currentState.save();
      final _userModel = Provider.of<UserModel>(context);
      User _user = await _userModel.signInWithGoogle();
      if (_user != null) print("Oturum açan id" + _user.userID.toString());
    } on PlatformException catch (e) {
      debugPrint("Witget Hata yakalandı0" + Exceptions.show(e.code));
    }
  }

  Future _loginwith_emailpassword(BuildContext context) async {
    _formKey.currentState.save();
    try {
      final _userModel = Provider.of<UserModel>(context);
      bool result =
          await _userModel.controlEmail(mail,userpassword);

      print(mail);
      print(userpassword);
      if (result==true && await _userModel.signInWithEmailAndPasswod(mail, userpassword)!=null){
          print("Oturum açan id");
        }
      else{
        _userModel.singOut();
        _showmessage("Giriş Yapılamadı","Lütfen E-postanıza gelen mail ile onaylama yapınız");
      }

    } on PlatformException catch (e) {
      _showmessage("Giriş Yapılamadı","E-posta veya şifre hatalı");
    }
  }

  _showmessage(String title,String message) async {
    await showDialog(
        context: context,
        builder: (context) {
          return PlatformAlertDialog(
            alert_title: title,
            alert_content: message,
            main_button_text: "TAMAM",
            cancel_button_text: null,
          );
        }
    );
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
                    ), //resim alanı

                    Container(
                      padding:
                          EdgeInsets.only(top: 55.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          LoginTextBoX(
                            label_text: 'E-POSTA',
                            text_color: Colors.grey,
                            underline_text_color: Colors.red,
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.done,
                            obscureText: false,
                            onSaved: (String email_adress) {
                              mail = email_adress;
                            },
                          ),
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
                              userpassword = password;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 15.0, left: 20.0),
                            child: InkWell(
                              onTap: () {
                                  _forgotpassword(_formKey.currentContext);
                              },
                              child: Text(
                                'Şifremi Unuttum',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                          SocialLoginButton(
                            button_text: "Giriş",
                            button_color: Colors.red,
                            button_text_color: Colors.white,
                            button_radius: 20,
                            button_height: 40,
                            onPressed: () => _loginwith_emailpassword(_formKey.currentContext),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          SocialLoginButtonWithIcon(
                            button_text: 'Google ile giriş yap',
                            button_color: Colors.transparent,
                            button_text_color: Colors.black,
                            button_radius: 20,
                            button_height: 40,
                            onPressed: () => _loginwithgoogle(context),
                            imageicon: AssetImage('assets/facebook.png'),
                          ),
                        ],
                      ),
                    ), //griş bilgisi alanı

                    SizedBox(
                      height: 15.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Uygulamada Yeni Misin ?',
                          style: TextStyle(fontFamily: 'Montserrat'),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () => _singup(context),
                          child: Text(
                            'Kayıt Ol',
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ), //yönlendirme alanı
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
        ),
        Container(
          padding: EdgeInsets.fromLTRB(185.0, 105.0, 0.0, 0.0),
          child: Text(
            'SINAVA ',
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
            'HAZIR MISIN ? ',
            style: TextStyle(
              color: (Colors.red),
              fontSize: 33.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ],
    );
  }
}
