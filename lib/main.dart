//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/logInUp_page.dart';
import 'package:rent_app/src/routes/routes.dart';
//--------------------------------------------------------------------------------------------------------------------


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
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



