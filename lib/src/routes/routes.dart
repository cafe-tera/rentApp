//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/contactos_page.dart';
import 'package:rent_app/src/pages/home_page.dart';
import 'package:rent_app/src/pages/logInUp_page.dart';
import 'package:rent_app/src/pages/mapa_page.dart';
import 'package:rent_app/src/pages/mis_domicilios_page.dart';
import 'package:rent_app/src/pages/buscar_domicilios_page.dart';
import 'package:rent_app/src/pages/chat_page.dart';
//--------------------------------------------------------------------------------------------------------------------


Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
        MisDomiciliosPage.routeName      :   (BuildContext context) => MisDomiciliosPage(),
        LogInUpPage.routeName            :   (BuildContext context) => LogInUpPage(),
        BuscarDomiciliosPage.routeName   :   (BuildContext context) => BuscarDomiciliosPage(),
        ChatPage.routeName               :   (BuildContext context) => ChatPage(),
        HomePage.routeName               :   (BuildContext context) => HomePage(),
        ContactosPage.routeName          :   (BuildContext context) => ContactosPage(),
        MapaPage.routeName               :   (BuildContext context) => MapaPage(),
  
  };
  
}