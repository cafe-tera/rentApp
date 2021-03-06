//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/providers/faq_provider.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
//--------------------------------------------------------------------------------------------------------------------

class BodyFaqPage extends StatefulWidget{

  @override
  _BodyFaqPageState createState() => _BodyFaqPageState();
}

class _BodyFaqPageState extends State<BodyFaqPage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('FAQ'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){
    return FutureBuilder(
      future: faqProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: _listaFaq(snapshot.data, context),
          ),
        );
      }
    );
  }

  List<Widget> _listaFaq(List<dynamic> data, BuildContext context){
    final List<Widget> faqList = [];
    var size = MediaQuery.of(context).size;

    data.forEach((faq){
      final widgetTemp = Container(
        height: 150.0,
        child: Material(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: size.width.toInt(),
                  child: _textoFaq(faq),
                ),
              ],
            ),
          ),
        ),
      );
      faqList..add(widgetTemp);
    });

    return faqList;
  }

  Widget _textoFaq(item){
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              alignment: Alignment.topLeft,
              child: Text(
                item.pregunta,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left:10.0, right: 10.0),
              child: Text(
                item.respuesta,
              ),
            ),
          ),
        ],
      ),
    );
  }
}