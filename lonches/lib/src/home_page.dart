import 'package:flutter/material.dart';
import 'package:lonches/colores.dart';
import 'package:lonches/src/usuario/carrito.dart';
import 'package:lonches/src/usuario/vendedores_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lonches'),
          centerTitle: true,
          backgroundColor: LoncheColor.mainThemeGreen,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Carrito())),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Erik German Ruiz',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  'erikgerman@astterapp.com',
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/dog.jpg'),
                ),
                decoration: BoxDecoration(color: Colors.transparent),
              ),
              ListTile(
                title: Text('Usuario'),
              ),
              ListTile(
                title: Text('Perfil'),
                leading: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text('Pedidos'),
                leading: Icon(Icons.shop),
              ),
              ListTile(
                title: Text('Ajustes'),
                leading: Icon(Icons.settings),
              ),
              Divider(),
            ],
          ),
        ),
        body: VendedoresView(),
      ),
    );
  }
}
