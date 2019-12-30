//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/pages/login_page.dart';

// local imports
//--------------------------------------------------------------------------------------------------------------------

class RegisterPage extends StatelessWidget {
  static final String routeName = 'register';
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Register Page'),
      ),
      body: Stack(
        children: <Widget>[
          // _crearImagen(context),
          _registerForm(context),
        ],
    ),
    );
  }

  Widget _registerForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: size.height * 0.05,
            ),
          ),
          Container(
            // color: Colors.blue,
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 30.0),
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

            child: Column(
              children: <Widget>[

                Text( 'Registro', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold )),
                SizedBox(height: 40.0,),
                _crearNombre(),
                _crearApellido(),
                _crearCelular(),
                _crearEmail(),
                _crearPassword(),
                _crearBotonContinuar(context),
                
              ],
            ),
          ),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearNombre() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.accessibility, color: Colors.blue[800]),
          labelText: 'Nombres',
        ),
      ),
    );
  }

  Widget _crearApellido() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.local_library, color: Colors.blue[800]),
          labelText: 'Apellidos',
        ),
      ),
    );
  }

  Widget _crearCelular() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.phone, color: Colors.blue[800]),
          hintText: '+56 9 58379397',
          labelText: 'Celular',
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
      child: Column(
        children: <Widget>[
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.blue[800]),
                labelText: 'Contraseña'),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.blue[800]),
                labelText: 'Confirmar contraseña'),
          ),
        ],
      ),
    );
  }

  // Widget _crearImagen(BuildContext context) {
  //   final size = MediaQuery.of(context).size;

  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //         vertical: size.height * 0.05, horizontal: size.width * 0.15),
  //     // color: Colors.black,
  //     child: Image(
  //       image: AssetImage('assets/rentApp.png'),
  //     ),
  //   );
  // }

  Widget _crearBotonContinuar(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text('Continuar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.0,
      color: Colors.blue[800],
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, LoginPage.routeName);
      },
    );
  }


}
