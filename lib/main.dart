import 'package:flutter/cupertino.dart';
import 'package:flutterexamproject/interfacepages/landing_page.dart';
import 'package:flutterexamproject/interfacepages/locator.dart';
import 'package:flutterexamproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


main() {
  setuploacator();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red, accentColor: Colors.blue),
        home: LandingPage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
