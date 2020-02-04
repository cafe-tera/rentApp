//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
import 'package:rent_app/src/pages/buscar_pages/buscar_domicilio_page.dart';
import 'package:rent_app/src/pages/buscar_pages/buscar_roomate_page.dart';
//--------------------------------------------------------------------------------------------------------------------


class BuscarPage extends StatefulWidget {
  const BuscarPage({ Key key}) : super(key: key);
  static final String routeName = 'buscar';

@override
  _BuscarPageState createState() => _BuscarPageState();
}

class _BuscarPageState extends State<BuscarPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Buscar'),
      ),
      drawer: MenuWidget(),
      body: Column(
        children:<Widget>[
          _BuscarDomBoton(),
          _BuscarMateBoton(),
        ]
      ) 
    );
  }


  

    Widget _BuscarDomBoton() {
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
                Text('Buscar Domicilio', style: TextStyle(color: Color(colors.textoBlanco), fontSize: 16),),
                Column()

              ],
            ),
            onPressed: (){
              Navigator.pushNamed(context, BuscarDomicilioPage.routeName);
              //Navigator.of(context).pushNamed(BuscarDomicilioPage.routeName);
            },
          ),
        );
        
    }

    Widget _BuscarMateBoton() {
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
                Text('Buscar Roomate', style: TextStyle(color: Color(colors.textoBlanco), fontSize: 16),),
                Column()

              ],
            ),
            onPressed: (){
              Navigator.pushNamed(context, BuscarRoomatePage.routeName);
              //Navigator.of(context).pushNamed(BuscarDomicilioPage.routeName);
            },
          ),
        );
    }
  
}