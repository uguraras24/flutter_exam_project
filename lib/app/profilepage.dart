import 'package:flutter/material.dart';
import 'package:flutterexamproject/interfacepages/drawer.dart';
import 'package:flutterexamproject/my_style_widget/platform_alertdialog.dart';
import 'package:provider/provider.dart';
import 'package:flutterexamproject/viewmodel/usermodel.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() {
    return new ProfileState();
  }
}

class ProfileState extends State<Profile> {
  TextEditingController _controllerUserName;
  TextEditingController _controllerUseremail;

  @override
  void initState() {
    super.initState();
    _controllerUserName = TextEditingController();
    _controllerUseremail = TextEditingController();
  }

  @override
  void dispose() {
    _controllerUseremail.dispose();
    _controllerUserName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    _controllerUseremail.text = _userModel.user.email;
    _controllerUserName.text = _userModel.user.userName;

    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "SINAVIM",
          style: TextStyle(
            color: Colors.red,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    Container(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                width: 80,
                                height: 60,
                                child: Center(
                                  child: Text(
                                    _userModel.user.examCoin.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Sınav Puanı",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                margin: EdgeInsets.only(top: 5),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                width: 80,
                                height: 60,
                                child: Center(
                                  child: Text(
                                    _userModel.user.programCoin.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 10),
                                child: Text(
                                  "Program Puanı",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                margin: EdgeInsets.only(top: 5),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        height: 60,
                        child: TextFormField(
                          controller: _controllerUseremail,
                          enabled: false,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "E-mail  ",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        height: 60,
                        child: TextFormField(
                          controller: _controllerUserName,
                          readOnly: false,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Kullanıcı Adı",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 140,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          height: 45,
                          width: 300,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.redAccent,
                            color: Colors.red,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                _userNameUpdate(context);
                              },
                              child: Center(
                                child: Text(
                                  'Güncelle',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _userNameUpdate(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    if (_userModel.user.userName != _controllerUserName.text) {
      print(_userModel.user.userName);
      String oldValue=_userModel.user.userName;
      String newValue=_controllerUserName.text;
      _userModel.user.userName=newValue;
      var updateresult = await _userModel.updateUserName(
          _userModel.user.userID, _controllerUserName.text);


      if (updateresult == true) {
        PlatformAlertDialog(
          alert_title: "Başarılı",
          alert_content: "Username Değiştirildi",
          main_button_text: "Tamam",
          cancel_button_text: null,
        ).show(context);
      } else {
        _userModel.user.userName=oldValue;
        PlatformAlertDialog(
          alert_title: "Hata",
          alert_content: "Username kullanımda farklı bir Username deneyiniz",
          main_button_text: "Tamam",
          cancel_button_text: null,
        ).show(context);
      }
    } else {
      PlatformAlertDialog(
        alert_title: "Hata",
        alert_content: "Değişiklik Yapmadınız",
        main_button_text: "Tamam",
        cancel_button_text: null,
      ).show(context);
    }
  }
}
