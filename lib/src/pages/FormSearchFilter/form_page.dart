//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/pages/FormSearchFilter/CantidadDePiezasField.dart';
import 'package:rent_app/src/pages/FormSearchFilter/CantidadDeBanosField.dart';
//import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class FormPage extends StatefulWidget {
  const FormPage({ Key key}) : super(key: key);
  static final String routeName = 'formulario';

@override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Buscar Domicilio'),
      ),
      body: Padding(
    padding: const EdgeInsets.all(50.0),
    child: Form(
      child: ListView(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Region'
            ),
          ),
          SizedBox(height: 16.0,),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Ciudad'
            ),
          ),
          SizedBox(height: 16.0,),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Sector'
            ),
          ),
          SizedBox(height: 16.0,),
          CantidadDePiezasField(),
          SizedBox(height: 16.0,),
          CantidadDeBanosField(),
          SizedBox(height: 16.0,),
          RaisedButton(
            child: Text('SUBMIT'),
            onPressed: () {
              // submit the form
            },
          )
        ],
      ),
    ),
  ),
    );
  }

}