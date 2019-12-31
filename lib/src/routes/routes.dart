//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/home_page.dart';
import 'package:rent_app/src/pages/logInUp_page.dart';
//--------------------------------------------------------------------------------------------------------------------


Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
        HomePage.routeName      :   (BuildContext context) => HomePage(),
        LogInUpPage.routeName     :   (BuildContext context) => new LogInUpPage(),
  };
  
}