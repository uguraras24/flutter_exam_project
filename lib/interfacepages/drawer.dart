import 'package:flutterexamproject/app/home_page.dart';
import 'package:flutterexamproject/my_style_widget/platform_alertdialog.dart';
import 'package:flutterexamproject/results.dart';
import 'package:flutterexamproject/staticpages/help.dart';
import 'package:flutter/material.dart';
import 'package:flutterexamproject/staticpages/contact.dart';
import 'package:flutterexamproject/staticpages/onboarding.dart';
import 'package:flutterexamproject/staticpages/coinpage.dart';
import 'package:flutterexamproject/app/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterexamproject/app/sweepstake.dart';
import 'package:flutterexamproject/viewmodel/usermodel.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../staticpages/payment.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final _userModel=Provider.of<UserModel>(context);
      print(_userModel.user.email);
    return Drawer(
      elevation: 20,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              _userModel.user.userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
            accountEmail: Text(
              _userModel.user.email,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            currentAccountPicture: Container(
              child: Image.asset(
                'assets/ba.jpg',
                fit: BoxFit.cover,
              ),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  _userModel.user.examCoin.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  _userModel.user.programCoin.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                elemanlar("Sınavlarım", Icons.home, HomePage()),
                elemanlar("Çekilişler", Icons.card_giftcard, SweepStake()),
                elemanlar("Profilim", Icons.account_circle, Profile()),
                elemanlar("Sınav Sonuçlarım", Icons.library_books, Results()),
                elemanlar("Ödeme", Icons.payment, Payment()),
                elemanlar("Hak Kazan", Icons.shutter_speed, CoinPage()),
                elemanlar("Nasıl Kullanılır ?", Icons.help_outline, OnBoardingScreen()),
                elemanlar("İletişim", Icons.mail, Contact()),
                elemanlar("Sıkça Sorulan Sorular", Icons.home, Help()),
                InkWell(
                  onTap: () async{
                    await _userModel.singOut();
                  },
                  splashColor: Colors.red,
                  child: ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Çıkış Yap",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool> _cikisYap(BuildContext context) async{
    final _userModel=Provider.of<UserModel>(context);
    bool sonuc= await _userModel.singOut();
    return sonuc;
  }
  Future _cikisOnay(BuildContext context) async {
    final _userModel=Provider.of<UserModel>(context);
    final result= await PlatformAlertDialog(
      alert_title: "Çıkış Yap",
      alert_content: "Çıkmak istediğinizden emin misiniz ?",
      main_button_text: "Evet",
      cancel_button_text: "İptal",
    ).show(context);
    if(result==true){
        await _userModel.singOut();
    }
  }
  InkWell elemanlar(value, icon, page, {color, function()}) {
    return InkWell(
      onTap: () {
        if (value == "Çıkış Yap") {
          function();
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      splashColor: Colors.red,
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

}
