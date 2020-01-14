//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/drawerMenu_pages/config_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/miPerfil_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/notificaciones_page.dart';
import 'package:rent_app/src/pages/drawerMenu_pages/tienda_page.dart';
import 'package:rent_app/src/pages/logInUp_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/home_page.dart';
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
                color: Colors.black12,
                  image: DecorationImage(
                    image: AssetImage('assets/rentApp.png'),
                    // fit: BoxFit.cover,
                  ),
                ),
              )
            ),
          ),

          ListTile(
            leading: Icon( Icons.people, color: Colors.indigo,),
            title: Text('Mi Perfil'),
            onTap: (){
              Navigator.pushNamed(context, PerfilPage.routeName);
            },
          ),

          ListTile(
            leading: Icon( Icons.storage, color: Colors.indigo,),
            title: Text('Home'),
            onTap: (){
              Navigator.pushNamed(context, HomePage.routeName);
            },
          ),

          ListTile(
            leading: Icon( Icons.notifications, color: Colors.indigo,),
            title: Text('Notificaciones'),
            onTap: (){
              Navigator.pushNamed(context, NotificacionesPage.routeName);
            },
          ),

          ListTile(
            leading: Icon( Icons.store, color: Colors.indigo,),
            title: Text('Tienda'),
            onTap: (){
              Navigator.pushNamed(context, TiendaPage.routeName);
            },
          ),

          Divider(),

          ListTile(
            leading: Icon( Icons.settings, color: Colors.indigo,),
            title: Text('Configuraciones'),
            onTap: (){
              Navigator.pushNamed(context, ConfigPage.routeName);
            },
          ),

          ListTile(
            leading: Icon( Icons.exit_to_app, color: Colors.indigo,),
            title: Text('Cerrar Sesión'),
            onTap: (){
              Navigator.pushNamed(context, LogInUpPage.routeName);
            },
          ),
          
          ListTile(
            leading: Icon(Icons.help, color: Colors.indigo,),
            title: Text('Help and Feedback')
          ),
              
     

        ],
      ),
    );
  }
}