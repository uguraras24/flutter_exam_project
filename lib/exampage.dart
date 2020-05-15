  import 'package:flutter/material.dart';

  class ExamPage extends StatefulWidget {
    @override
    _ExamPageState createState() => _ExamPageState();
  }

  class _ExamPageState extends State<ExamPage> {
    String sinav = "ayt";

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 30,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 0, right: 0, bottom: 0.0),
                    child: Text(
                      'AYT DENEME ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 70, top: 0, right: 0, bottom: 0.0),
                    child: Text(
                      'KALAN SÜRE  47:24',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0.0),
                    child: Icon(
                      Icons.hourglass_full,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    if (sinav == "ayt")
                      makeItem(image: 'assets/sinav1.png', uzunluk: 550)
                    else if (sinav == "tyt")
                      makeItem(image: 'assets/sinav1.png', uzunluk: 400)
                    else
                      makeItem(image: 'assets/sinav3.png', uzunluk: 500),
                    makeItem(image: 'assets/sinav3.png', uzunluk: 600)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      );
    }

    Widget makeCategory({title}) {
      return AspectRatio(
        aspectRatio: 1.6 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 2),
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(),
            ),
          ),
        ),
      );
    }

    Widget makeCategory1({logo}) {
      return AspectRatio(
        aspectRatio: 1.6 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: Colors.green[200], borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Icon(logo),
          ),
        ),
      );
    }

    Widget makeItem({image, double uzunluk}) {
      return AspectRatio(
        aspectRatio: 1 / 1.4,
        child: GestureDetector(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("deneme"),
                ),
                Container(
                  height: uzunluk,
                  width: 380,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      )),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                stops: [
                                  .2,
                                  .9
                                ],
                                colors: [
                                  Colors.white.withOpacity(.1),
                                  Colors.white.withOpacity(.1)
                                ])),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      makeCategory(title: 'A'),
                      makeCategory(title: 'B'),
                      makeCategory(title: 'C'),
                      makeCategory(title: 'D'),
                      makeCategory(title: 'E'),
                      makeCategory1(logo: Icons.favorite),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
