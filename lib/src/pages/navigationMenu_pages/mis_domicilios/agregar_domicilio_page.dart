//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/mis_domicilios_bloc/agregar_domicilios_bloc.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class AgregarDomicilioPage extends StatelessWidget {
  static final String routeName = 'agregar_domicilio';

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

    String tipo = '';
    String lng = '';
    String lat = '';
    String img = '';

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
      onPressed: () {},
    );
  }



}
