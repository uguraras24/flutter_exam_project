import 'interfacepages/drawer.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  @override
  ResultsState createState() {
    // TODO: implement createState
    return new ResultsState();
  }
}

class ResultsState extends State<Results> {
  int secilenMenuItem = 2;
  @override
  Widget build(BuildContext context) {
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
            expandedHeight: 50,
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
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              _elemanlar,
              childCount: 3,
            ),
            itemExtent: 290,
          ),
        ],
      ),
    );
  }
}


Widget _elemanlar(BuildContext context, int index) {
  return Container(
    color: Colors.white,
    height: 144,
    child: Card(
      borderOnForeground: false,
      margin: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 0.0),
      elevation: 6,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, top: 15, right: 0, bottom: 0.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.rate_review),
                  Text(
                    " | SINAV TÜRÜ              -->",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(left: 50, top: 0, right: 0, bottom: 0),
                    child: Text(
                      "AYT SINAVI",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                    child: Text(
                      "Sınav Tarihi",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(left: 190, top: 0, right: 0, bottom: 0),
                    child: Text("Sınav Saati"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                    child: Text(
                      "15 Mayıs 2020",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(left: 188, top: 0, right: 0, bottom: 0),
                    child: Text(
                      "20:00",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                    child: Text(
                      "Sınav Açıklaması",
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
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                    child: Text(
                      "Sınav hakkında ki açıklama bla bladır",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                    child: Text(
                      "Sıralama",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Colors.transparent,
                    ),
                    height: 25,
                    width: 69,
                    margin:EdgeInsets.only(left: 207, top: 0, right: 0, bottom: 0),
                    child: Center(
                      child: Text("1.875.123",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                    child: Text(
                      "Puan",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Colors.transparent,
                    ),
                    height: 25,
                    width: 69,
                    margin:EdgeInsets.only(left: 230, top: 0, right: 0, bottom: 0),
                    child: Center(
                      child: Text("215.875",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
              child:  Container(
                height: 38.0,
                child: Material(
                  shadowColor: Colors.redAccent,
                  color: Colors.red,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'DETAYLAR İÇİN TIKLA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
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
