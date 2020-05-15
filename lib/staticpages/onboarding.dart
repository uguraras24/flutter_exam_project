import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterexamproject/app/home_page.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentpage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentpage ? _indicator(true) : _indicator(false));
    }
    return list;
  }


  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // TODO: implement build
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      'Atla',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),//atla butonu
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentpage = page;
                      });
                    },
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/ob1.jpg',
                              ),
                              height: MediaQuery.of(context).size.height*0.70,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ],
                      ),//sayfa1
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/ob2.jpg',
                              ),
                              height: MediaQuery.of(context).size.height*0.70,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ],
                      ),//sayfa2
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/ob3.jpg',
                              ),
                              height: MediaQuery.of(context).size.height*0.70,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ],
                      ),//sayfa3
                    ],
                  ),
                ),//sayfalar
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
                _currentpage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () => {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease)
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'İleri',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.red,
                            size: 30.0,
                          )
                        ],
                      ),
                    ),
                  ),
                )
                    : Text(""),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentpage == _numPages - 1
          ? Container(
        height: 70.0,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(top: 22),
                child: Text(
                  'Hadi Başlayalım',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
          : Text(''),
    );
  }
}
