import 'package:flutter/cupertino.dart';
import 'package:flutterexamproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../interfacepages/drawer.dart';

class Payment extends StatefulWidget {
  @override
  PaymentState createState() {
    // TODO: implement createState
    return new PaymentState();
  }
}

class PaymentState extends State<Payment> {

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    _userModel.getSweepStakeUser();
    return Scaffold(
      appBar: AppBar(
        title:Text("SINAVIM",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: Center(
        child:Container(
          margin: EdgeInsets.all(10),
          child:  Text(
              "Bu sayfa gelecek sezon kullanıma açılacaktır, Önümüzde ki sınava kadar bu zor günlerde size destek olabilmek için bütün sınavlara ücretsiz girebilirsiniz, Sınav Puan haklarınız bittiğinde Hak kazan sayfamızdan video izlemeniz yeterlidir",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Montserrat',
            ),
          ) ,
        ),
      ),
    );
  }

}

