//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

// local imports
import 'package:rent_app/src/pages/navigationMenu_pages/home_page/home_page.dart';
import 'package:rent_app/src/models/user_model.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class LogInUpPage extends StatefulWidget {
  LogInUpPage({Key key}) : super(key: key);
  static final String routeName = 'logInUp';

  @override
  _LogInUpPageState createState() => _LogInUpPageState();
}

class _LogInUpPageState extends State<LogInUpPage> {
  bool isLogin = true;
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email = "";
  String password = "";
  String nombre = "";
  String apellido = "";
  String celular = "";
  String uid = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(colors.fondoBlanco),
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
            child: Image.asset('assets/rentApp.png')
          ),
        ),
      ),
    );
  }

  Widget _cardForm(BuildContext context, Size size) {
    if (isLogin) {
      return SingleChildScrollView(child: _loginForm(context, size));
    } else {
      return SingleChildScrollView(child: _registerForm(context, size));
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
                    _crearOlvidoContrasena(),
                  ],
                ),
              ),
            ),
            _crearBotones(context),
          ],
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
                blurRadius: 2.0,
                spreadRadius: 2.5,
              )
            ]),
        child: Column(children: <Widget>[
          Text('Registro',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              )),
          SizedBox(
            height: size.height * 0.4,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _crearNombre(),
                  _crearApellido(),
                  _crearCelular(),
                  _crearEmail(),
                  _crearPassword(),
                ],
              ),
            ),
          ),
          _crearBotones(context),
        ]),
      ),
    );
  }

  Widget _crearNombre() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        onChanged: (value){
          nombre = value;
        },
        decoration: InputDecoration(
          icon: Icon(Icons.accessibility, color: Color(colors.azulGeneral)),
          labelText: 'Nombres',
        ),
      ),
    );
  }

  Widget _crearApellido() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        onChanged: (value){
          apellido = value;
        },
        decoration: InputDecoration(
          icon: Icon(Icons.local_library, color: Color(colors.azulGeneral)),
          labelText: 'Apellidos',
        ),
      ),
    );
  }

  Widget _crearCelular() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        onChanged: (value){
          celular = value;
        },
        decoration: InputDecoration(
          icon: Icon(Icons.phone, color: Color(colors.azulGeneral)),
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
        textAlign: TextAlign.center,
        onChanged: (value){
          email = value;
        },
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Color(colors.azulGeneral)),
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
          textAlign: TextAlign.center,
          onChanged: (value){
            password = value;
          },
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Color(colors.azulGeneral)),
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
              textAlign: TextAlign.center,
              onChanged: (value){
                password = value;
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline, color: Color(colors.azulGeneral)),
                  labelText: 'Contraseña'),
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              // onChanged: (value){
              //   email = value;
              // },
              decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Color(colors.azulGeneral)),
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
    return Container(
      child: RaisedButton(
        color: Color(colors.azulGeneral),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        onPressed: () async {
          setState(() {
            isLogin = true;
            showProgress = true;
          });

          try{
            final newUser = await _auth.signInWithEmailAndPassword(
              email: email,
              password: password
            );
            if(newUser != null){
              setState((){
                Navigator.pushNamed(context, HomePage.routeName);
                showProgress = false;
              });
              Fluttertoast.showToast(
                msg: "Login exitoso",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 3,
                backgroundColor: Colors.blueAccent,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            } else {
              Fluttertoast.showToast(
                msg: "Verifica los datos de inicio",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 3,
                backgroundColor: Colors.blueAccent,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }

          } catch(e){}
        },
        child: Text(
          'Ingresar',
          ),
        textColor: Colors.white,
      ),
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
      color: Color(colors.azulGeneral),
      textColor: Colors.white,
      onPressed: (){
        setState(() {
          isLogin = false;
        });
      },
    );
  }

  Widget _crearBotonVolver(BuildContext context) {
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
      color: Color(colors.azulGeneral),
      textColor: Colors.white,
      onPressed: () {
        setState(() {
          isLogin = true;
        });
      },
    );
  }

  Widget _crearBotonConfirmar(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Color(colors.azulGeneral),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      onPressed: () async{
        setState(() {
          isLogin = false;
          showProgress = true;
        });
        try {
          final newUser = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password
          );
          if(newUser != null){
            final FirebaseUser user = await _auth.currentUser();
            uid = user.uid;

            final newUser = User(
              id: this.uid,
              nombre: this.nombre,
              apellido: this.apellido,
              celular: this.celular,
              puntos: null,
              imagen: null
            );

            insertData(newUser.toJson());

            Fluttertoast.showToast(
              msg: "¡Registro exitoso! \n Inicia sesión para continuar",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 5,
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            //Navigator.pushNamed(context, HomePage.routeName);
            setState(() {
              showProgress = false;
              isLogin = true;
            });
          }
        } catch(e){}
      },
      textColor: Colors.white,
      child: Container(
        child: Text('Confirmar Registro'),
      ),
    );
  }

  Widget _crearOlvidoContrasena() {
    return FlatButton(
      child: Text('¿Olvidó su contraseña?'),
      onPressed: (){},
    );
  }

  Future<void> insertData(final user) async {
    Firestore firestore = Firestore.instance;
    firestore.collection("users").add(user).catchError((e){
      print(e);
    });
  }
}