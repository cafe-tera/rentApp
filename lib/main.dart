//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/resources/routes/routes.dart';
import 'package:rent_app/src/pages/logInUp_page.dart';
//--------------------------------------------------------------------------------------------------------------------

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: LogInUpPage.routeName,
          routes: getApplicationRoutes(),
        );
  }
}
