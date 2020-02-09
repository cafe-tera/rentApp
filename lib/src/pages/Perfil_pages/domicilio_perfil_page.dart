//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// local imports
import 'package:rent_app/src/widgets/ratingBar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
import 'package:rent_app/src/models/domicilio_model.dart';
//--------------------------------------------------------------------------------------------------------------------

class DomicilioPerfilPage extends StatefulWidget {
  static final String routeName = 'perfilcomentario';

  final domiciliosData;
  
  DomicilioPerfilPage({
    Key key,
    this.domiciliosData
  }) : super(key: key); //To receive data from parent page

  @override
  _DomicilioPerfilPageState createState() => _DomicilioPerfilPageState();
}

class _DomicilioPerfilPageState extends State<DomicilioPerfilPage>{
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil Domicilio'),
        backgroundColor: Color(colors.azulGeneral),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState((){
                _favoriteStateChange(widget.domiciliosData['Favorito']);
              });
            },
            icon: Icon( (widget.domiciliosData['Favorito'])? Icons.favorite : Icons.favorite_border ),//_favoritedIconDefault
          )
        ],
      ),  

      body: _contenido(size, widget.domiciliosData)
    );
  }

  Widget _contenido(Size size, item){
    return Container(
      height: size.height,
      color:  Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _encabezado(size, item),
            Divider(),
            _cuerpo(size, item),
            Divider(),

            // Comentarios
            _tituloConBoton(size, item, 'Comentarios', 'ver más'),
            SizedBox(height: 10,),
            _comentarios(size, item),

            // para que haya espacio al final
            SizedBox(height: 20,)

          ],
        ),
        
      ),
    );
  }

  Widget _encabezado(Size size, item){
    double rating = item['Puntos'];
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[

        //portada, con una ubicacion aproximada del comentario
        _region(size, item),

        Column(
          children: <Widget>[
            
            SizedBox(height: size.height*0.2,),

            // imagen + puntuacion del perfil
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                _imagenDomicilio(item),
                Column(
                  children: <Widget>[
                    SizedBox(height: size.height*0.08,),
                    RatingBarWidget(ratingValue: rating, barSize: 15.0,),
                  ],
                ),
                    
              ],
            ),

            // icons buttons
            _acciones(size, item)
          ],
        ),


      ]
    );
  }

  Widget _region(Size size, item) {
    return Container(
      height: size.height*0.28,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/profile/ubicacion.PNG',),
          fit: BoxFit.cover
        )
      ),
    );
  }

  Widget _acciones(Size size, item) {
    return Row(
      children: <Widget>[

        RawMaterialButton(
          onPressed: (){},
          child: Icon(Icons.map, color: Colors.white,),
          shape: CircleBorder(),
          elevation: 5.0,
          fillColor: Colors.lightBlue,
        ),

        RawMaterialButton(
          onPressed: (){},
          child: Icon(Icons.person_pin, color: Colors.white,),
          shape: CircleBorder(),
          elevation: 5.0,
          fillColor: Colors.lightBlue,
        ),

      ],
    );
  }

  Widget _imagenDomicilio(domData) {
    return Column(
      children: <Widget>[

        // imagen
        Card(
          margin: EdgeInsets.all(3.0),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          child: Container(
            padding: EdgeInsets.all(2.5),
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: NetworkImage(
                  domData['Imagen']
                ),
                placeholder: AssetImage('assets/Alternate-Preloader.gif',),
                fadeInDuration: Duration(milliseconds: 200),
              ),
            ),
          ),
        ),

        SizedBox(height: 7,),

        //tipo comentario
        Text(
          domData['Tipo'],
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
        ),

      ],
    );
  }

  Widget _cuerpo(Size size, domData){
    return Column(
      children: <Widget>[

        // informacion
        _tituloElementos(size, domData, 'Información'),
        SizedBox(height: 10,),   
        Text(
          domData["Texto"],
          textWidthBasis: TextWidthBasis.longestLine,
        ),

        Divider(),

        // fotos
        _tituloElementos(size, domData, 'Fotos'),
        SizedBox(height: 10,),
        _photosCarouselSlider(context, size, domData),

      ],
    );
  }


  Widget _comentarios(Size size, domData) {
    final List<Widget> comentarios = [];
    int indice = 0;
    print(domData["Comentarios"][indice]['Imagen']);

    domData["Comentarios"].forEach((comentario) {
      final widgetTemp = Container(
        height: 75.0,
        child: Material(
          child: Card(
            elevation: 1.0,
            child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 20,
                    child: Text('foto'),
                    // child: _imagenComentario(size, domData["Comentarios"], indice),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 30,
                    child: Text('item: comentario)'),
                  ),
                ],
              ),
            )
        ),
      );

      comentarios..add(widgetTemp);
      indice += 1;
    });

    return Column(children: comentarios);
  }

  Icon _favoritedIconDefault = new Icon(
    Icons.favorite_border,
    color: Colors.white,    
  );
    
  _favoriteStateChange(_liked){
    if(_liked){
      _favoritedIconDefault = new Icon(
        Icons.favorite_border,
        color: Colors.white,
      );
      _liked = false;
    }
    else{
      _favoritedIconDefault = new Icon(
        Icons.favorite,
        color: Colors.white,
      );
      _liked = true;
    }
  }

  _tituloElementos(Size size, domData, String titulo) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Row(
        children: <Widget>[
              
          SizedBox(width: size.width*0.07,),

          Text(
            titulo,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),

        ],
      )
    );
  }

  _photosCarouselSlider(BuildContext context, Size size, domData) {
    return CarouselSlider(
      height: size.height*0.3,
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/no-image.jpg',),
                  fit: BoxFit.cover
                )
              ),
            );
          },
        );
      }).toList(),
    );
  }

  _tituloConBoton(Size size, item, String titulo, String texto_boton) {

    int numeroComentarios = 21;

    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Row(
        children: <Widget>[
              
          SizedBox(width: size.width*0.07,),

          Text(
            titulo,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),

          Expanded(child: Container()),

          FlatButton(
            onPressed: (){},
            child: Text(
              texto_boton + ' (${numeroComentarios})',
              style: TextStyle(
                fontSize: 18,
                color: Colors.lightBlue,
                fontWeight: FontWeight.w300
              ),
            ),
          ),

        ],
      )
    );
  }

  // Widget _imagenComentario(Size size, domData, int indice) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(5.0),
  //       child: FadeInImage(
  //         fit: BoxFit.cover,
  //         alignment: Alignment.center,
  //         image: NetworkImage(
  //           domData["Comentarios"][indice]['Imagen'],
  //         ),
  //         placeholder: AssetImage('assets/Alternate-Preloader.gif',),
  //         fadeInDuration: Duration(milliseconds: 200),
  //       ),
  //     ),
  //   );
  // }


}