//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

// local imports
import 'package:rent_app/src/bloc/mis_domicilios_bloc/agregar_domicilios_bloc.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mis_domicilios/mis_domicilios_page.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
import 'package:rent_app/src/models/domicilio_model.dart';
//--------------------------------------------------------------------------------------------------------------------

class AgregarDomicilioPage extends StatefulWidget {
  static final String routeName = 'agregar_domicilio';

  @override
  _AgregarDomicilioPageState createState() => _AgregarDomicilioPageState();

}

class _AgregarDomicilioPageState extends State<AgregarDomicilioPage> {
  
  final _auth = FirebaseAuth.instance;

  String tipo = "";
  String lng = "";
  String lat = "";
  String img = "";
  String uid = "";

  @override
  Widget build(BuildContext context) {
    AgregarDomiciliosBloc _bloc = AgregarDomiciliosBloc();

    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Agregar Domicilio'),
      ),
      body: _agregarDomicilio(_bloc, context),
    );
  }

  _agregarDomicilio(AgregarDomiciliosBloc bloc, BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
      children: <Widget>[

        TextField(
          onChanged: (value) {
            tipo = value;
          },
          decoration: InputDecoration(
            icon: Icon(Icons.home, color: Color(colors.azulGeneral)),
            labelText: 'Tipo',
            helperText: '(ej: casa, departamento, habitación, etc...)'
          ),
          
        ),

        Divider(),

        TextField(
          onChanged: (value) {
            lng = value;
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.place, color: Color(colors.azulGeneral)),
            labelText: 'Coordenada longitudinal',
            helperText: '(Santiago: -70.382323)'
          ),
          
        ),

        Divider(),

        TextField(
          onChanged: (value) {
            lat = value;
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.place, color: Color(colors.azulGeneral)),
            labelText: 'Coordenada Latitudinal',
            helperText: '(Santiago: -33.282158)'
          ),
          
        ),

        Divider(),

        TextField(
          onChanged: (value) {
            img = value;
          },
          decoration: InputDecoration(
            icon: Icon(Icons.image, color: Color(colors.azulGeneral)),
            labelText: 'Imagen Domicilio',
            helperText: '*copiar direccion de la imagen* a cualquier imagen de google'
          ),
          
        ),

        SizedBox(height: 60,),
        
        _crearBotonSubmit(context),

      ],
    ));
  }


  Widget _crearBotonSubmit(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          'Submit',
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.0,
      color: Color(colors.azulGeneral),
      textColor: Colors.white,
      onPressed: () async {
        //final _auth = FirebaseAuth.instance;
        final FirebaseUser user = await _auth.currentUser();
        uid = user.uid;

        Ubicacion ubicacion = new Ubicacion(
          lat: double.parse(this.lat),
          lng: double.parse(this.lng)
        );

        List<Informacion> info = new List(0);

        List<Comentario> comment = new List(0);

        List<String> fotos = new List(0);

        final newDomicilio = Domicilio(
          id: null,
          userId: this.uid,
          tipo: this.tipo,
          texto: null,
          imagen: img,
          estado: "green",
          puntos: 0.0,
          favorito: false,
          ubicacion: ubicacion,
          informacion: info,
          fotos: fotos,
          comentarios: comment
        );

        try{
          insertData(newDomicilio.toJson());

          Fluttertoast.showToast(
            msg: "Domicilio añadido exitosamente",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 5,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          setState(() {
            Navigator.pushNamed(context, MisDomiciliosPage.routeName);
          });
        } catch(e){
          print(e);
        }
      },
    );
  }

  Future<void> insertData(final domicilio) async {
    Firestore firestore = Firestore.instance;
    firestore.collection("domicilios").add(domicilio).catchError((e){
      print(e);
    });
  }


}
