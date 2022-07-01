import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_web/modelos/usuario.dart';
import '../peticiones/peticioneshttp.dart';

class ListaUsuarios extends StatefulWidget {
  @override
  State<ListaUsuarios> createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Usuarios'),
      ),
      body: getInfo(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 42, 192, 124),
        onPressed: () {
          setState(() {
            getInfo(context);
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
      future: listaUsuarios(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator(
              backgroundColor: Color.fromARGB(184, 107, 20, 173),
            );

          case ConnectionState.done:
            return snapshot.data != null
                ? vistaUser(usuarios: snapshot.data)
                : Text("No se tiene datos");
          default:
            return Text("Cargando .......");
        }
      });
}

class vistaUser extends StatelessWidget {
  final List<Usuario> usuarios;
  const vistaUser({Key? key, required this.usuarios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            enabled: true,
            title: Text(
                usuarios[posicion].User + "  " + usuarios[posicion].Password),
          );
        });
  }
}
