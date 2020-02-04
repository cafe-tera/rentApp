import 'package:flutter/material.dart';

class CantidadDeBanosField extends StatefulWidget {
  @override
  _CantidadDeBanosFieldState createState() => _CantidadDeBanosFieldState();
}

class _CantidadDeBanosFieldState extends State<CantidadDeBanosField> {

  final FocusNode _focusNode = FocusNode();

  OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {

        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context).insert(this._overlayEntry);

      } else {
        this._overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {

    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: this._layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: Text('1'),
                  onTap: () {
                    print('1 Tapped');
                  },
                ),
                ListTile(
                  title: Text('2'),
                  onTap: () {
                    print('2 Tapped');
                  },
                ),
                ListTile(
                  title: Text('3'),
                  onTap: () {
                    print('3 Tapped');
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: TextFormField(
          focusNode: this._focusNode,
        decoration: InputDecoration(
          labelText: 'Cantidad de baños'
        ),
      ),
    );
  }
}