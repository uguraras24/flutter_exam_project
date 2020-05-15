import 'package:flutter/material.dart';
import 'package:flutterexamproject/interfacepages/drawer.dart';


class Contact extends StatefulWidget {
  @override
  ContactState createState() {
    // TODO: implement createState
    return new ContactState();
  }
}

class ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(
              color: Colors.red, //change your color here
            ),
            backgroundColor: Colors.white,
            expandedHeight: 200,
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
                'assets/contact.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              elemanlar(
                  "TELEFON",
                  "+90 534 454 81 86",
                  "+90 535 629 46 54",
                  "FAX",
                  "+90 212 608 11 26",
                  "+90 212 608 11 26",
                  "E-POSTA",
                  "uguraras24@gmail.com",
                  "sinavim@info.com",
                  "SOSYAL MEDYA",
                  "İnstagram - sinavimobil",
                  "Twitter - sinavimobil",
                  MediaQuery.of(context).size.width
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> elemanlar(isim, deger, deger2, isim2, deger3, deger4, isim3, deger5, deger6, isim4, deger7, deger8,width) {
  return [
    elemanlaralt(isim, deger, deger2, Colors.white, Colors.red, Icons.call,width),
    elemanlaralt(isim2, deger3, deger4, Colors.red, Colors.white, Icons.print,width),
    elemanlaralt(isim3, deger6, deger5, Colors.white, Colors.red, Icons.alternate_email,width),
    elemanlaralt(isim4, deger7, deger8, Colors.red, Colors.white, Icons.perm_media,width),
    //maps(),
  ];
}

Container elemanlaralt(isim, deger, deger2, backcolor, fontcolor, icon,width) {
  return Container(
    height: 190,
    child: Card(
      borderOnForeground: false,
      margin: EdgeInsets.only(left:width/11 , top: 15, right: width/11, bottom: 0.0),
      elevation: 4,
      child: Container(
        color: backcolor,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      icon,
                      color: fontcolor,
                    ),
                    margin: EdgeInsets.only(
                        left: 0, top: 15, right: 15, bottom: 10.0),
                  ),
                  Container(

                    child:Text(
                      isim,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: fontcolor,
                          fontFamily: 'Montserrat'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
                    child: Text(
                      deger,
                      style: TextStyle(
                          color: fontcolor, fontWeight: FontWeight.bold,fontSize:15,fontFamily: 'Montserrat'),
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
                    EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                    child: Text(
                      deger2,
                      style: TextStyle(
                          color: fontcolor, fontWeight: FontWeight.bold,fontSize:15,fontFamily: 'Montserrat'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

