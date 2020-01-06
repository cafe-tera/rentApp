//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/LogInUp_bloc/logInUp_bloc.dart';
import 'package:rent_app/src/pages/home_page.dart';
import 'package:rent_app/src/pages/logInUp_pages/logInUp_page.dart';
//--------------------------------------------------------------------------------------------------------------------

class LoginPage extends StatelessWidget {

  final LogInUpBloc _logInUpBloc = LogInUpBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                blurRadius: 2.0,
                spreadRadius: 2.5,
              )
            ]),
        child: Column(
          children: <Widget>[
            Text('Inicio de sesión',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                )),
            SizedBox(
              height: size.height * 0.4,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.06,),
                    _crearEmail(),
                    _crearPassword(),
                  ],
                ),
              ),
            ),
            _crearBotones(context),
            Text('¿Olvido la contraseña?'),
          ],
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
          _crearBotonIngresar(context),
          SizedBox(height: 30.0),
          _crearBotonRegistro(context),
        ],
      );
  }

  Widget _crearBotonIngresar(BuildContext context) {
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
        _logInUpBloc.register();
        LogInUpPage();
      },
    );
  }
}