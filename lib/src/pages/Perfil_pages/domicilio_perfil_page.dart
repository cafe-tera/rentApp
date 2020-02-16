//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// local imports
import 'package:rent_app/src/widgets/ratingBar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
import 'package:rent_app/src/models/domicilio_model.dart';
import 'package:rent_app/src/pages/Perfil_pages/comentarios_perfil_page.dart';
//--------------------------------------------------------------------------------------------------------------------

class DomicilioPerfilPage extends StatefulWidget {
  static final String routeName = 'perfilcomentario';

  final Domicilio domiciliosData;

  // Recibe el domicilio a mostrar
  DomicilioPerfilPage({Key key, this.domiciliosData}) : super(key: key);

  @override
  _DomicilioPerfilPageState createState() => _DomicilioPerfilPageState();
}

class _DomicilioPerfilPageState extends State<DomicilioPerfilPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil Domicilio'),
          backgroundColor: Color(colors.azulGeneral),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  _favoriteStateChange(widget.domiciliosData.favorito);
                });
              },
              icon: Icon((widget.domiciliosData.favorito)
                  ? Icons.favorite
                  : Icons.favorite_border), //_favoritedIconDefault
            )
          ],
        ),
        body: _contenido(size, widget.domiciliosData));
  }

  Widget _contenido(Size size, Domicilio domicilio) {
    return Container(
      height: size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _encabezado(size, domicilio),
            Divider(),
            _cuerpo(size, domicilio),

            SizedBox(
              height: 60,
            ),

            // Comentarios
            _tituloConBoton(size, domicilio, 'Comentarios', 'ver más'),
            SizedBox(
              height: 10,
            ),
            _comentarios(size, domicilio),

            // para que haya espacio al final
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _encabezado(Size size, Domicilio domicilio) {
    double rating = domicilio.puntos;
    return Stack(alignment: Alignment.topCenter, children: <Widget>[
      //portada, con una ubicacion aproximada del comentario
      _region(size, domicilio),

      Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.2,
          ),

          // imagen + puntuacion del perfil
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _imagenDomicilio(domicilio),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  RatingBarWidget(
                    ratingValue: rating,
                    barSize: 15.0,
                  ),
                ],
              ),
            ],
          ),

          // icons buttons
          _acciones(size, domicilio)
        ],
      ),
    ]);
  }

  Widget _region(Size size, Domicilio domicilio) {
    return Container(
      height: size.height * 0.28,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/profile/ubicacion.PNG',
              ),
              fit: BoxFit.cover)),
    );
  }

  Widget _acciones(Size size, Domicilio domicilio) {
    return Row(
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.map,
            color: Colors.white,
          ),
          shape: CircleBorder(),
          elevation: 5.0,
          fillColor: Colors.lightBlue,
        ),
        RawMaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.person_pin,
            color: Colors.white,
          ),
          shape: CircleBorder(),
          elevation: 5.0,
          fillColor: Colors.lightBlue,
        ),
      ],
    );
  }

  Widget _imagenDomicilio(Domicilio domicilio) {
    return Column(
      children: <Widget>[
        // imagen
        Card(
          margin: EdgeInsets.all(3.0),
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            padding: EdgeInsets.all(2.5),
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: NetworkImage(domicilio.imagen),
                placeholder: AssetImage(
                  'assets/Alternate-Preloader.gif',
                ),
                fadeInDuration: Duration(milliseconds: 200),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 7,
        ),

        //tipo comentario
        Text(
          domicilio.tipo,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _cuerpo(Size size, Domicilio domicilio) {
    return Column(
      children: <Widget>[
        // informacion
        _tituloElementos(size, domicilio, 'Información'),
        SizedBox(
          height: 10,
        ),
        Text(
          domicilio.texto,
          textWidthBasis: TextWidthBasis.longestLine,
        ),

        Divider(),

        // fotos
        _tituloElementos(size, domicilio, 'Fotos'),
        SizedBox(
          height: 10,
        ),
        _photosCarouselSlider(context, size, domicilio),
      ],
    );
  }

  Widget _comentarios(Size size, Domicilio domicilio) {
    final List<Widget> comentarios = [];
    int indice = 0;

    if (comentarios != null) {
      domicilio.comentarios.forEach((comentario) {

        // Sólo muestra los 3 primeros comentarios
        if (indice < 3) {
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
                                  child: _imagenComentario(
                                      size, domicilio, indice)),
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
                              ))
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
        } else {
          return Column(children: comentarios);
        }
      });

      return Column(children: comentarios);
    } else {
      return Container();
    }
  }

  _tituloElementos(Size size, domicilio, String titulo) {
    return Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: size.width * 0.07,
            ),
            Text(
              titulo,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  _photosCarouselSlider(BuildContext context, Size size, Domicilio domicilio) {
    return CarouselSlider(
      height: size.height * 0.3,
      viewportFraction: 0.65,
      enlargeCenterPage: true,
      items: domicilio.fotos.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: FadeInImage(
                  placeholder: AssetImage(
                    'assets/no-image.jpg',
                  ),
                  image: NetworkImage(i),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  _tituloConBoton(
      Size size, Domicilio domicilio, String titulo, String texto_boton) {
    int numeroComentarios = domicilio.comentarios.length;
    if (domicilio.comentarios.length > 3) {
      return Container(
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.07,
              ),
              Text(
                titulo,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ComentariosPerfil(
                              domiciliosData: domicilio,
                            )),
                  );
                },
                child: Text(
                  texto_boton + ' (${numeroComentarios})',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ));
    } else {
      return Container(
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.07,
              ),
              Text(
                titulo,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              Container()
            ],
          ));
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

  Icon _favoritedIconDefault;

  _favoriteStateChange(_liked) {
    if (_liked) {
      _favoritedIconDefault = new Icon(
        Icons.favorite_border,
        color: Colors.white,
      );
      _liked = false;
    } else {
      _favoritedIconDefault = new Icon(
        Icons.favorite,
        color: Colors.white,
      );
      _liked = true;
    }
  }
}
