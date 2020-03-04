//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/resources/colors.dart' as colors;
import 'package:rent_app/src/models/domicilio_model.dart';
import 'package:rent_app/src/pages/Perfil_pages/domicilio_perfil_page.dart';
import 'package:rent_app/src/widgets/ratingBar_widget.dart';
//--------------------------------------------------------------------------------------------------------------------

class DomicilioDetails extends StatelessWidget {
  final Domicilio item;

  DomicilioDetails({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String img;
    if(item.imagen != null && item.imagen != ''){
      img = item.imagen;
    }else{
      img = 'https://images.vexels.com/media/users/3/78633/preview2/5497463229c36ae24bc58a495d1081d6-dibujo-de-casa-de-dos-pisos.jpg';
    }
    String tipo;
    if(item.tipo != null && item.imagen != ''){
      tipo = item.tipo;
    }else{
      tipo = 'Casa';
    }
    return Wrap(
      children: <Widget>[
        Center(
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 40,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DomicilioPerfilPage(
                        domiciliosData: item,
                      )),
            );
          },
          child: Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      image: NetworkImage(
                        img,
                      ),
                      placeholder: AssetImage(
                        'assets/Alternate-Preloader.gif',
                      ),
                      fadeInDuration: Duration(milliseconds: 200),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Text(
                          tipo,
                          style: TextStyle(fontSize: 16),
                        ),

                        Container(
                          child: RatingBarWidget(
                            ratingValue: item.puntos !=null? item.puntos:4.0,
                            barSize: 14.0,
                          ),
                        ),

                        

                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DomicilioPerfilPage(
                                          domiciliosData: item,
                                        )),
                              );
                            },
                            color: Color(colors.azulGeneral),
                            child: Text(
                              'Ver Detalle',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white
                              ),
                              
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
