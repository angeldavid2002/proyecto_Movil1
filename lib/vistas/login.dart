import 'package:flutter/material.dart';
import 'package:proyecto_web/Peticiones/Peticioneshttp.dart';
import 'package:proyecto_web/modelos/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_web/vistas/vista_usuario.dart';

List<Usuario> lista = [];

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(253, 188, 89, 1),
        child: Center(
          child: Campos(),
        ),
      ),
    );
  }
}

class Campos extends StatefulWidget {
  Campos({Key? key}) : super(key: key);

  @override
  State<Campos> createState() => _CamposState();
}

class _CamposState extends State<Campos> {
  TextEditingController controluser = new TextEditingController();
  TextEditingController controlpassword = new TextEditingController();
  bool usuariovacio = true;
  bool contrasenavacia = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 350,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/logotendero.png'),
              radius: 150,
            ),
          ),
          Container(
            width: 400,
            //height: 250,
            margin: EdgeInsets.fromLTRB(50, 1, 50, 2),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: controluser,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.verified_user),
                      filled: true,
                      labelText: 'User',
                    ),
                  ),
                ),
                (usuariovacio)
                    ? Container()
                    : Text('No hay datos, por favor digitelos'),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 15),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: controlpassword,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.lock_open_outlined),
                      //Color.fromRGBO(253, 188, 89, 1),
                      filled: true,
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                ),
                (contrasenavacia)
                    ? Container()
                    : Text('No hay datos, por favor digitelos'),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                  
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(244, 48, 85, 1),
                        fixedSize: const Size(300, 50),
                      ),
                      onPressed: () {
                        validarLogin(http.Client(), controluser.text,
                                controlpassword.text)
                            .then((response) {
                          lista = response.toList();
                          if (lista.length > 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => VistaUsuario()),
                            );
                          } else {
                            Alerta(
                              context,
                              "el usuario o la contraseña son incorrectos"
                            );
                          }
                        });
                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 18.0,
                            color: Colors.white),
                      )),
                ),
                Divider(
                  color: Colors.grey,
                  height: 40,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(53, 161, 31, 1),
                        fixedSize: const Size(150, 50),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Registrate',
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 18.0,
                            color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool validar() {
    bool validado = false;
    if (controluser.text.isEmpty || controlpassword.text.isEmpty) {
      if (controluser.text.isEmpty) {
        usuariovacio = false;
        validado = false;
      } else {
        usuariovacio = false;
        validado = false;
      }

      if (controlpassword.text.isEmpty) {
        contrasenavacia = false;
        validado = false;
      } else {
        contrasenavacia = false;
        validado = false;
      }
      if (controluser.text == 'tendero' && controlpassword.text == '123') {
        usuariovacio = true;
        contrasenavacia = true;
        validado = true;
      } else {
        usuariovacio = false;
        contrasenavacia = false;
        validado = false;
      }
    } else {
      if (controluser.text == 'tendero' && controlpassword.text == '123') {
        usuariovacio = true;
        contrasenavacia = true;
        validado = true;
      } else {
        usuariovacio = false;
        contrasenavacia = false;
        validado = false;
      }
    }
    setState(() {});
    return validado;
  }
}

///////////////////////////////////////
void Alerta(BuildContext context, String texto) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Alerta"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Text(texto)),
              ],
            ),
            actions: [
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
}
