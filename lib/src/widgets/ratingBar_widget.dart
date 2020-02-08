//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
//--------------------------------------------------------------------------------------------------------------------

class RatingBarWidget extends StatelessWidget{

  final int starCount = 5;
  final double barSize;
  final double ratingValue;

  RatingBarWidget({
    Key key,
    @required this.ratingValue,
    @required this.barSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: StarRating(
              size: barSize,
              rating: ratingValue,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Center(
            child: Text(
              "$ratingValue",
              style: TextStyle(
                fontSize: barSize*0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

}