//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/home_page.dart';
import 'package:rent_app/src/pages/login_page.dart';
import 'package:rent_app/src/pages/register_page.dart';
//--------------------------------------------------------------------------------------------------------------------


Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
        HomePage.routeName      :   (BuildContext context) => HomePage(),
        LoginPage.routeName     :   (BuildContext context) => LoginPage(),
        RegisterPage.routeName  :   (BuildContext context) => RegisterPage(),
  
  };
  
}