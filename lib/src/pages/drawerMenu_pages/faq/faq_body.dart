//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/bloc/faq_bloc/faq_bloq.dart';
import 'package:rent_app/src/bloc/provider.dart';

// local imports
import 'package:rent_app/src/models/faq_model.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
//--------------------------------------------------------------------------------------------------------------------

class BodyFaqPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    FaqBloc _bloc = Provider.of<FaqBloc>(context);
    _bloc.cargarFaq();

    return Scaffold(
      appBar: AppbarWidget(
        title: Text('FAQ'),
      ),
      body: _disernir(_bloc, context),
    );
  }

  Widget _disernir(FaqBloc _bloc, BuildContext context){
    return Container(
      child: StreamBuilder(
        stream: _bloc.stream,
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){
          return _lista(_bloc.faqs, context);
        },
      ),
    );
  }

  Widget _lista(List<Faq> faqs, BuildContext context){
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: _listaFaq(faqs, context),
      ),
    );
  }

  List<Widget> _listaFaq(List<Faq> data, BuildContext context){
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