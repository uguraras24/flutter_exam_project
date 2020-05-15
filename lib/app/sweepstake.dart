import 'package:flutter/cupertino.dart';
import 'package:flutterexamproject/model/sweepStakeUser.dart';
import 'package:flutterexamproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';
import '../interfacepages/drawer.dart';
import 'package:flutter/material.dart';

class SweepStake extends StatefulWidget {
  @override
  SweepStakeState createState() {
    // TODO: implement createState
    return new SweepStakeState();
  }
}

class SweepStakeState extends State<SweepStake> {

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
      body:   FutureBuilder<List<SweepStakeUser>>(
          future: _userModel.getSweepStakeUser(),
          builder: (context, result) {
            if (result.hasData) {
              var allUsers = result.data;
              if (allUsers.length > 0) {
                return ListView.builder(
                    itemCount: allUsers.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height/3,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/kazananlar.png',
                              fit: BoxFit.cover,
                            )
                          ),
                          elemanlaralt(result.data[index].winner1),
                          elemanlaralt(result.data[index].winner2),
                          elemanlaralt(result.data[index].winner3),
                          elemanlaralt(result.data[index].winner4),
                          elemanlaralt(result.data[index].winner5),
                          elemanlaralt(result.data[index].winner6),
                          elemanlaralt(result.data[index].winner7),
                          elemanlaralt(result.data[index].winner8),
                          elemanlaralt(result.data[index].winner9),
                          elemanlaralt(result.data[index].winner10),


                        ],
                      );
                    }
                );
              }
              else {
                return Center(child: Text("Kullanıcı Yok"));
              }
            }
            else {
              return Center(
                child: CircularProgressIndicator(backgroundColor: Colors.red,)
              );
            }
          }
      ),
    );
  }


  Container elemanlaralt(isim) {
    debugPrint(isim);
    return
      isim!=""
    ? Container(
      height: 32,
      child: Card(
        borderOnForeground: false,
        elevation: 4,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        isim,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
          : Container(
      );
  }
}

