import 'package:flutter/material.dart';
import 'package:proyecto_web/vistas/seleccion_rol.dart';

class VistaUsuario extends StatelessWidget {
  const VistaUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PaginaInicio());
  }
}

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(244, 48, 85, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => VistaRol()),
            );
          },
          icon: const Icon(Icons.home, color: Color.fromRGBO(253, 188, 89, 1)),
        ),
        title: TextFormField(
          style: TextStyle(color: Color.fromRGBO(253, 188, 89, 1)),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Color.fromRGBO(253, 188, 89, 1)),
            hintText: "Producto...",
            prefixIcon:
                Icon(Icons.search, color: Color.fromRGBO(253, 188, 89, 1)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(253, 188, 89, 1)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(253, 188, 89, 1)),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(253, 188, 89, 1)),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.map, color: Color.fromRGBO(253, 188, 89, 1)),
          )
        ],
      ),
      body: Lista(),
    );
  }
}

class Lista extends StatelessWidget {
  const Lista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Ofertas',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Ofertas(),
          Text(
            'productos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            color: Color.fromRGBO(253, 188, 89, 1),
            child: ListTile(
                title: Text('Productos'),
                subtitle: Text('Descripcion corta de los productos')),
          ),
          Card(
            color: Color.fromRGBO(253, 188, 89, 1),
            child: ListTile(
                title: Text('Productos'),
                subtitle: Text('Descripcion corta de los productos')),
          ),
          Card(
            color: Color.fromRGBO(253, 188, 89, 1),
            child: ListTile(
                title: Text('Productos'),
                subtitle: Text('Descripcion corta de los productos')),
          ),
          Card(
            color: Color.fromRGBO(253, 188, 89, 1),
            child: ListTile(
                title: Text('Productos'),
                subtitle: Text('Descripcion corta de los productos')),
          ),
          Card(
            color: Color.fromRGBO(253, 188, 89, 1),
            child: ListTile(
                title: Text('Productos'),
                subtitle: Text('Descripcion corta de los productos')),
          ),
        ],
      ),
    );
  }
}

class Ofertas extends StatelessWidget {
  const Ofertas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Container(
            color: Color.fromRGBO(253, 188, 89, 1),
            child: Center(
                child: Text('Productos',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ),
        ),
      ),
    );
  }
}
