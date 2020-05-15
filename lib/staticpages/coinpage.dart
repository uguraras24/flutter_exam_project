import 'package:flutterexamproject/interfacepages/drawer.dart';
import 'package:flutter/material.dart';

class CoinPage extends StatefulWidget {
  @override
  CoinPageState createState() {
    // TODO: implement createState
    return new CoinPageState();
  }
}

class CoinPageState extends State<CoinPage> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child :Container(
          height: 400,
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left:25,right: 10),
                    child: Text(
                      "SINAV HAKKI KAZANMAK İÇİN TIKLA",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Center(
                  child: Container(
                    height: 70,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'REKLAM İZLE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Center(
                  child: Container(
                    height: 70,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'REKLAM İZLE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Center(
                  child: Container(
                    height: 70,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'REKLAM İZLE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
