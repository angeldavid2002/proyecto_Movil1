

import 'package:flutter/material.dart';
import 'package:proyecto_web/vistas/login.dart';
import 'package:proyecto_web/vistas/vista_usuario.dart';

class VistaRol extends StatefulWidget {
  VistaRol({Key? key}) : super(key: key);

  @override
  State<VistaRol> createState() => _VistaRolState();
}

class _VistaRolState extends State<VistaRol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 188, 89, 1),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 200.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/logotendero.png'),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 227, 183, 1),
                  ),
                  width: 400,
                  height: 250,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Seleccione su tipo de rol',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 25.0,
                            color: Color.fromRGBO(254, 74, 86, 1)),
                      ),
                      SizedBox(height: 35),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(244, 48, 85, 1),
                            fixedSize: const Size(300, 50),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Login()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tendero',
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                              Container(
                                child: Image.asset("images/tendero.png"),
                                width: 40,
                                height: 40,
                              )
                            ],
                          )),
                      SizedBox(height: 30),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(244, 48, 85, 1),
                            fixedSize: const Size(300, 50),
                          ),
                          onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => VistaUsuario()),
                            );},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cliente',
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                              Container(
                                child: Image.asset("images/cliente.png"),
                                width: 40,
                                height: 40,
                              )
                            ],
                          )),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
