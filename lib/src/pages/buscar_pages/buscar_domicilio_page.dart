//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
import 'package:rent_app/src/pages/FormSearchFilter/form_page.dart';
//--------------------------------------------------------------------------------------------------------------------

class BuscarDomicilioPage extends StatefulWidget {
  const BuscarDomicilioPage({ Key key}) : super(key: key);
  static final String routeName = 'buscar_domicilio';

@override
  _BuscarDomicilioPageState createState() => _BuscarDomicilioPageState();
}
class _BuscarDomicilioPageState extends State<BuscarDomicilioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Buscar Domicilio'),
      ),
      body: _FilterBoton(),
    );
  }

  Widget _FilterBoton() {
      return Container(
          height: 45,
          child: RaisedButton(
            color: Color(colors.buscarDomicilio),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Icon(Icons.add, color: Color(colors.iconBlanco), size: 22,),
                Text('Filtros de Busqueda', style: TextStyle(color: Color(colors.textoBlanco), fontSize: 16),),
                Column()

              ],
            ),
            onPressed: (){
              Navigator.pushNamed(context, FormPage.routeName);
            },
          ),
        );
        
    }
}