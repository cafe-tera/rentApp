//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/pages/home_page.dart';

// local imports
import 'package:rent_app/src/pages/register_page.dart';
//--------------------------------------------------------------------------------------------------------------------

class LoginPage extends StatelessWidget {

  static final String routeName = 'login';
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Login Page'),
      ),

      body: Stack(
        children: <Widget>[

          _crearImagen(context),
          _loginForm(context),

        ],
      ),
    );
  }

  Widget _crearImagen(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.05, horizontal: size.width * 0.15),
      // color: Colors.black,
      child: Image(
        image: AssetImage('assets/rentApp.png'),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: size.height * 0.28,
            ),
          ),

          Container(

            // color: Colors.blue,
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric( vertical: 10.0 ),
            padding: EdgeInsets.symmetric( vertical: 30.0 ),
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  spreadRadius: 5.0,
                )
              ]

            ),

            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 50.0,),
                _crearEmail(),
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 30.0),
                _crearBotones(context),
                SizedBox(height: 15.0),
                Text('¿Olvido la contraseña?'),
              ],
            ),
          ),

          SizedBox( height: 100.0 )

        ],
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.blue[800]),
          hintText: 'ejemplo@ejemplo.cl',
          labelText: 'Correo electrónico',
        ),
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock_outline, color: Colors.blue[800]),
            labelText: 'Contraseña'),
      ),
    );
  }


  Widget _crearBotones(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _crearBotonLogin(context),
        SizedBox(height: 30.0),
        _crearBotonRegistro(context),
      ],
    );

  }

  Widget _crearBotonLogin(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text('Ingresar',),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.0,
      color: Colors.blue[800],
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, HomePage.routeName);
      },
    );
  }

  Widget _crearBotonRegistro(BuildContext context) {

    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text('Registrarse'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.0,
      color: Colors.blue[800],
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, RegisterPage.routeName);
      },
    );

  }

}
