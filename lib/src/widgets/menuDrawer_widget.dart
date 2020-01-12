//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/logInUp_page.dart';
import 'package:rent_app/src/pages/mis_domicilios_page.dart';
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
            leading: Icon( Icons.pages, color: Colors.indigo,),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, MisDomiciliosPage.routeName),
          ),

          ListTile(
            leading: Icon( Icons.search, color: Colors.indigo,),
            title: Text('Buscar Domicilio'),
            onTap: (){},
          ),

          Divider(),

          ListTile(
            leading: Icon( Icons.people, color: Colors.indigo,),
            title: Text('Mi Perfil'),
            onTap: (){},
          ),

                    ListTile(
            leading: Icon( Icons.home, color: Colors.indigo,),
            title: Text('Mis Domicilios'),
            onTap: (){},
          ),
          
          // SizedBox(height: size.height * 0.05,),
          Divider(),

          ListTile(
            leading: Icon( Icons.settings, color: Colors.indigo,),
            title: Text('Configuraciones'),
            onTap: (){},
          ),

          ListTile(
            leading: Icon( Icons.exit_to_app, color: Colors.indigo,),
            title: Text('Cerrar Sesión'),
            onTap: (){
              Navigator.pushReplacementNamed(context, LogInUpPage.routeName);
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