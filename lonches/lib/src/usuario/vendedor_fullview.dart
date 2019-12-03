import 'package:flutter/material.dart';
import 'package:lonches/colores.dart';
import 'package:lonches/models.dart';

class VendedorFullView extends StatefulWidget {
  VendedorFullView({Key key, this.vendedor}) : super(key: key);

  final VendedorView vendedor;

  @override
  _VendedorFullViewState createState() => _VendedorFullViewState();
}

class _VendedorFullViewState extends State<VendedorFullView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.vendedor.nombre),
          backgroundColor: LoncheColor.mainThemeGreen,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/dog.jpg'),
              radius: 70,
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text('Descripción:'),
              subtitle: Text(widget.vendedor.descripcion),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Chocolate Hershey'),
                        trailing: Text('\$15',
                            style:
                                TextStyle(color: Colors.green, fontSize: 23)),
                      ),
                      GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              contentPadding: EdgeInsets.all(0),
                                  content: Image.asset('assets/chocolate.jpeg'),
                                )),
                        child: Image.asset(
                          'assets/chocolate.jpeg',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Cantidad: ' + '1'),
                          RaisedButton(
                            color: LoncheColor.mainThemeGreen,
                            child: Text(
                              'Añadir a canasta',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
