//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/home_page.dart';
//--------------------------------------------------------------------------------------------------------------------


class LogInUpPage extends StatefulWidget {
  LogInUpPage({Key key}) : super(key: key);
  static final String routeName = 'logInUp';

  @override
  _LogInUpPageState createState() => _LogInUpPageState();
}

class _LogInUpPageState extends State<LogInUpPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _crearAppBar(size),
      body: SafeArea(
        child: _cardForm(context, size),
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

  Widget _cardForm(BuildContext context, Size size) {
    if (isLogin) {
      return _loginForm(context, size);
    } else {
      return _registerForm(context, size);
    }
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
              Text('Inicio de sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )),
              SizedBox(
                height: 50.0,
              ),
              _crearEmail(),
              _crearPassword(),
              SizedBox(height: 40.0),
              _crearBotones(context),
              SizedBox(height: 15.0),
              Text('¿Olvido la contraseña?'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerForm(BuildContext context, Size size) {
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
              Text('Registro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )),
              SizedBox(
                height: 50.0,
              ),
              _crearNombre(),
              _crearApellido(),
              _crearCelular(),
              _crearEmail(),
              _crearPassword(),
              SizedBox(height: 40.0),
              _crearBotones(context),
              SizedBox(height: 15.0),
              Text('¿Olvido la contraseña?'),
            ],
          ),
        ),
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
    if (isLogin) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.blue[800]),
              labelText: 'Contraseña'),
        ),
      );
    } else {
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
  }

  Widget _crearBotones(BuildContext context) {
    if (isLogin) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _crearBotonIngresar(context),
          SizedBox(height: 30.0),
          _crearBotonRegistro(context),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _crearBotonVolver(context),
          SizedBox(height: 30.0),
          _crearBotonConfirmar(context),
        ],
      );
    }
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
        setState(() {
          isLogin = false;
        });
      },
    );
  }

  _crearBotonVolver(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          'Volver',
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.0,
      color: Colors.blue[800],
      textColor: Colors.white,
      onPressed: () {
        setState(() {
          isLogin = true;
        });
      },
    );
  }

  _crearBotonConfirmar(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          'Confirmar',
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
}
