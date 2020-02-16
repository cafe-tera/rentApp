//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/ratingBar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
import 'package:rent_app/src/models/domicilio_model.dart';
//--------------------------------------------------------------------------------------------------------------------

class ComentariosPerfil extends StatelessWidget {
  static final String routeName = 'comentarios';

  final Domicilio domiciliosData;

  // Recibe el domicilio a mostrar
  ComentariosPerfil({Key key, this.domiciliosData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Comentarios'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: _comentarios(size, domiciliosData))),
    );
  }

  List<Widget> _comentarios(Size size, Domicilio domicilio) {
    final List<Widget> comentarios = [];
    int indice = 0;

    if (comentarios != null) {
      domicilio.comentarios.forEach((comentario) {
        final widgetTemp = Container(
          child: InkWell(
            onTap: () {},
            child: Card(
              elevation: 0.0,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: 60,
                                width: 70,
                                child:
                                    _imagenComentario(size, domicilio, indice)),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  domicilio.comentarios[indice].nombres +
                                      ' ' +
                                      domicilio.comentarios[indice].apellidos,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'fecha uwu',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )),

                              SizedBox(
                                width: 25,
                              ),

                              Container(
                                child: RatingBarWidget(
                                  ratingValue: domicilio.puntos,
                                  barSize: 15.0,
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        domicilio.comentarios[indice].comentario,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

        comentarios..add(Divider());
        comentarios..add(widgetTemp);

        indice += 1;
      });

      comentarios..add(Divider());
      return comentarios;
    } else {
      return List<Widget>();
    }
  }

  Widget _imagenComentario(Size size, Domicilio domicilio, int indice) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FadeInImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: NetworkImage(
            domicilio.comentarios[indice].imagen,
          ),
          placeholder: AssetImage(
            'assets/Alternate-Preloader.gif',
          ),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
