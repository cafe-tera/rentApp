//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:ui';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _crearAppBar(size),
      body: SafeArea(
        child: _loginForm(context, size),
      ),
    );
  }

    Widget _crearAppBar(Size size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.26),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Container(
              height: size.height * 0.23,
              child: Image.asset('assets/rentApp.png')),
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context, Size size) {
    return Center(
      heightFactor: 1.1,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.62,
        padding: EdgeInsets.symmetric(vertical: size.width * 0.04),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                spreadRadius: 5.0,
              )
            ]),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Text(
                'Inicio de sesión',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22, 
                )
              ),

              SizedBox(
                height: 50.0,
              ),
              _crearEmail(),
              SizedBox(height: 25.0),
              _crearPassword(),
              SizedBox(height: 25.0),
              _crearBotones(context),
              SizedBox(height: 15.0),
              Text('¿Olvido la contraseña?'),

            ],
          ),
        ),
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
        child: Text(
          'Ingresar',
        ),
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
