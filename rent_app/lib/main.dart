import 'package:flutter/material.dart';
import 'package:rent_app/src/pages/home_page.dart';
import 'package:rent_app/src/pages/login_page.dart';
import 'package:rent_app/src/routes/routes.dart';
import 'package:splashscreen/splashscreen.dart';


void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new AfterSplash(),
      image: Image.asset('assets/rentApp.png'),
      backgroundColor: Colors.black,
      photoSize: size.height * 0.25,
      loaderColor: Colors.blue[800],
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: LoginPage.routeName,
      routes: getApplicationRoutes(),
      
    );
  }
}


