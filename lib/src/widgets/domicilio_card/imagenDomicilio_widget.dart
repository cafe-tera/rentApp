//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/models/domicilio_model.dart';
//--------------------------------------------------------------------------------------------------------------------

class ImagenDomicilioWidget extends StatelessWidget{

  final Domicilio item;

  ImagenDomicilioWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){

    String img;
    if(item.imagen != null && item.imagen != ''){
      img = item.imagen;
    }else{
      img = 'https://images.vexels.com/media/users/3/78633/preview2/5497463229c36ae24bc58a495d1081d6-dibujo-de-casa-de-dos-pisos.jpg';
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: FadeInImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: NetworkImage(
            img,
          ),
          placeholder: AssetImage('assets/Alternate-Preloader.gif',),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }

}