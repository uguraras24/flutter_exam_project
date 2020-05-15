import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterexamproject/interfacepages/drawer.dart';
import 'package:flutterexamproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:flutterexamproject/model/exams.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    // TODO: implement createState
    return new HomePageState();
  }
/*
    return */
}

class HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  int secilenMenuItem = 0;
  String id;

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    // TODO: implement build
    return Scaffold(
      drawer: DrawerMenu(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(
              color: Colors.red, //change your color here
            ),
            backgroundColor: Colors.white,
            expandedHeight: 205,
            floating: true,
            pinned: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
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
              background: Image.asset(
                'assets/ba.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: FutureBuilder<List<Exams>>(
                future: _userModel.readExam(),
                builder: (context, result) {
                  if (result.hasData) {
                    var allUsers = result.data;
                    if (allUsers.length > 0) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: allUsers.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                _elemanlar(
                                    result.data[index].examname,
                                    result.data[index].time,
                                    result.data[index].tarih,
                                    result.data[index].description,
                                    MediaQuery.of(context).size.width),

                              ],
                            );
                          });
                    } else {
                      return Center(child: Text("Kullanıcı Yok"));
                    }
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ));
                  }
                }),
          )
        ],
      ),
    );
  }
}

Widget _elemanlar(String examname, String time, String tarih,
    String description, double width1) {
  double width = width1;
  return Column(
    children: <Widget>[
      Container(
        color: Colors.white,
        height: 158,
        child: Card(
          borderOnForeground: false,
          margin: EdgeInsets.only(
              left: width / 14, top: 15, right: width / 14, bottom: 0.0),
          elevation: 6,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 0, top: 15, right: 0, bottom: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.rate_review),
                      Text(
                        examname,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          debugPrint("deger : ");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            border: Border.all(
                              color: Colors.red,
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                          ),
                          margin: EdgeInsets.only(
                              left: 170, top: 0, right: 0, bottom: 0),
                          child: Text(
                            "KATIL",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin:
                        EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                        child: Text(
                          "Tarih",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                        EdgeInsets.only(left: 250, top: 0, right: 0, bottom: 0),
                        child: Text(
                          "Saat",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin:
                        EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                        child: Text(
                          tarih,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin:
                        EdgeInsets.only(left: 188, top: 0, right: 0, bottom: 0),
                        child: Text(
                          time,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 18, top: 18, right: 0, bottom: 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
