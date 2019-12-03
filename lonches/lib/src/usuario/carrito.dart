import 'package:flutter/material.dart';
import 'package:lonches/colores.dart';

class Carrito extends StatefulWidget {
  Carrito({Key key}) : super(key: key);

  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Carrito'),
          centerTitle: true,
          backgroundColor: LoncheColor.mainThemeGreen,
        ),
      ),
    );
  }
}
