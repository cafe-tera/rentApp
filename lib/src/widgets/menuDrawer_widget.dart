//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/drawerMenu_pages/config_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/contactos/contactos_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/domiciliosFavoritos_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/faq/faq_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/miPerfil_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/notificaciones/notificaciones_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/tienda_page.dart';
import 'package:rent_app/src/pages/logInUp_page.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------


class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: <Widget>[

          Container(
            height: size.height * 0.18,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                decoration: BoxDecoration(
                color: Color(colors.fondoLogo),
                  image: DecorationImage(
                    image: AssetImage('assets/rentApp.png'),
                    // fit: BoxFit.cover,
                  ),
                ),
              )
            ),
          ),

          ListTile(
            leading: Icon( Icons.people, color: Color(colors.iconos),),
            title: Text('Mi Perfil'),
            onTap: (){
              Navigator.pushNamed(context, MiPerfilPage.routeName);
            },
          ),

          ListTile(
            leading: Icon( Icons.notifications, color: Color(colors.iconos),),
            title: Text('Notificaciones'),
            onTap: (){
              Navigator.pushNamed(context, NotificacionesPage.routeName);
            },
          ),

          ListTile(
            leading: Icon( Icons.contacts, color: Color(colors.iconos),),
            title: Text('Contactos'),
            onTap: (){
              Navigator.pushNamed(context, ContactosPage.routeName);
            },
          ),

          ListTile(
            leading: Icon( Icons.favorite, color: Color(colors.iconos)),
            title: Text('Mis favoritos'),
            onTap: (){
              Navigator.pushNamed(context, MisDomiciliosFavoritosPage.routename);
            },
          ),

          ListTile(
            leading: Icon( Icons.store, color: Color(colors.iconos),),
            title: Text('Tienda'),
            onTap: (){
              Navigator.pushNamed(context, TiendaPage.routeName);
            },
          ),

          Divider(),

          ListTile(
            leading: Icon( Icons.settings, color: Color(colors.iconos),),
            title: Text('Configuraciones'),
            onTap: (){
              Navigator.pushNamed(context, ConfigPage.routeName);
            },
          ),

          ListTile(
            leading: Icon(Icons.help, color: Color(colors.iconos),),
            title: Text('Help and Feedback'),
            onTap: (){
              Navigator.pushNamed(context, FaqPage.routeName);
            },
          ),
          
          ListTile(
            leading: Icon( Icons.exit_to_app, color: Color(colors.iconos),),
            title: Text('Cerrar Sesión'),
            onTap: (){
              Navigator.pushNamed(context, LogInUpPage.routeName);
            },
          ),
          
              
     

        ],
      ),
    );
  }
}