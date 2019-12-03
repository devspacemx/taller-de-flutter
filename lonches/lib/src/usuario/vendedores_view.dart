import 'package:flutter/material.dart';
import 'package:lonches/colores.dart';
import 'package:lonches/models.dart';
import 'package:lonches/src/usuario/vendedor_fullview.dart';

class VendedoresView extends StatefulWidget {
  VendedoresView({Key key}) : super(key: key);

  @override
  _VendedoresViewState createState() => _VendedoresViewState();
}

class _VendedoresViewState extends State<VendedoresView> {
  List<VendedorView> _dataList = [
    VendedorView(nombre: 'Wonka', descripcion: 'Chocolates'),
    VendedorView(nombre: 'Daniel', descripcion: 'Panes, dulces, aguas'),
    VendedorView(nombre: 'Marcos', descripcion: 'Galletas del costco, jugos '),
    VendedorView(nombre: 'Javier', descripcion: 'Burritos'),
    VendedorView(nombre: 'Walter White', descripcion: 'Cristal Blue'),
  ];
  @override
  Widget build(BuildContext context) {

    List<ListTile> _listTiles = _dataList
        .map((vendedor) => ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/dog.jpg'),
              ),
              title: Text(vendedor.nombre),
              subtitle: Text(vendedor.descripcion),
              trailing: Icon(Icons.arrow_drop_down, size: 40,),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => VendedorFullView(
                        vendedor: vendedor,
                      ))),
            ))
        .toList();

    return Scaffold(
      body: Container(
        child: ListView(
          children: _listTiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: LoncheColor.mainThemeGreen,
        onPressed: () {
          String _nombreNuevo;
          String _descNuevo;
          String _error;
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Crear vendedor nuevo'),
                  TextFormField(
                    onChanged: (value) => _nombreNuevo = value,
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => _descNuevo = value,
                    decoration: InputDecoration(
                      hintText: 'Descripcion',
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      'Crear',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: LoncheColor.mainThemeGreen,
                    elevation: 7,
                    onPressed: () {
                      if (_nombreNuevo != null && _nombreNuevo != '') {
                        if (_descNuevo != null && _descNuevo != '') {
                          setState(() {
                            _dataList.add(VendedorView(
                                nombre: _nombreNuevo,
                                descripcion: _descNuevo,
                                uid: '12323kflk'));
                          });
                          Navigator.of(context).pop();
                        } else {
                          //no ingresó la descripción
                          _error = 'Ingresa su descripción';
                          _alert(_error);
                        }
                      } else {
                        //no ingresó el nombre
                        setState(() {
                          _error = 'Ingresa su nombre';
                          _alert(_error);
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future _alert(String _error) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: Text(_error),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ));
  }
}
