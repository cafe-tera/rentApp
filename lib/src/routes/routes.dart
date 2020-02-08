//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/logInUp_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/tienda_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/config_page.dart';
import 'package:rent_app/src/pages/Perfil_pages/user_perfil_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/chat_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/home_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/miPerfil_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mapa_page.dart';
import 'package:rent_app/src/pages/Perfil_pages/domicilio_perfil_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/contactos_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/notificaciones_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mis_domicilios_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/buscar_pages/buscar_page.dart';

import 'package:rent_app/src/pages/navigationMenu_pages/buscar_pages/buscar_domicilio_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/buscar_pages/buscar_roomate_page.dart';
import 'package:rent_app/src/pages/FormSearchFilter/form_page.dart';

import 'package:rent_app/src/pages/drawerMenu_pages/faq_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/domiciliosFavoritos_page.dart';
//--------------------------------------------------------------------------------------------------------------------


Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
        MisDomiciliosPage.routeName      :   (BuildContext context) => MisDomiciliosPage(),
        LogInUpPage.routeName            :   (BuildContext context) => LogInUpPage(),
        BuscarPage.routeName             :   (BuildContext context) => BuscarPage(),
        ChatPage.routeName               :   (BuildContext context) => ChatPage(),
        HomePage.routeName               :   (BuildContext context) => HomePage(),
        ContactosPage.routeName          :   (BuildContext context) => ContactosPage(),
        MapaPage.routeName               :   (BuildContext context) => MapaPage(),
        MiPerfilPage.routeName           :   (BuildContext context) => MiPerfilPage(),
        PerfilPage.routeName             :   (BuildContext context) => PerfilPage(),
        NotificacionesPage.routeName     :   (BuildContext context) => NotificacionesPage(),
        TiendaPage.routeName             :   (BuildContext context) => TiendaPage(),
        ConfigPage.routeName             :   (BuildContext context) => ConfigPage(),
        DomicilioPerfilPage.routeName    :   (BuildContext context) => DomicilioPerfilPage(),

        BuscarDomicilioPage.routeName    :   (BuildContext context) => BuscarDomicilioPage(),
        BuscarRoomatePage.routeName      :   (BuildContext context) => BuscarRoomatePage(),
        FormPage.routeName               :   (BuildContext context) => FormPage(),
  
        FaqPage.routeName                :   (BuildContext context) => FaqPage(),
        MisDomiciliosFavoritosPage.routename       :   (BuildContext context) => MisDomiciliosFavoritosPage(),
  };
  
}