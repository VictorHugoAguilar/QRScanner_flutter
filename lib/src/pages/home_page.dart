import 'package:flutter/material.dart';
import 'package:qrreader/src/pages/direcciones_page.dart';
import 'package:qrreader/src/pages/mapas_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: _callPage(currentIndex),
      appBar: _crearAppBar(),
      bottomNavigationBar: _crearBottomNavigatorBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _crearActionButton(),
    );
    return scaffold;
  }

  Widget _crearBottomNavigatorBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          // ignore: deprecated_member_use
          title: Text('Mapas'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          // ignore: deprecated_member_use
          title: Text('Direcciones'),
        ),
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPages();
      case 1:
        return DireccionesPage();
      default:
        return MapasPages();
    }
  }

  Widget _crearActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {},
    );
  }

  Widget _crearAppBar() {
    return AppBar(
      title: Text('QR Scanner'),
      actions: [
        IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            print('delete app bar');
          },
        )
      ],
    );
  }
}
