import 'package:flutter/material.dart';
import 'package:proyecto_web/modelos/usuario.dart';
List<Usuario> lista = [];

class RegistroTendero extends StatelessWidget {
  const RegistroTendero({Key? key}) : super(key: key);

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
 ///TENDERO
  TextEditingController controlnombre = new TextEditingController();
  TextEditingController controlapellido = new TextEditingController();
  TextEditingController controlcorreo = new TextEditingController();
  TextEditingController controltelefono = new TextEditingController();
  TextEditingController controlpassword = new TextEditingController();

  /// TIENDA
  TextEditingController controlNIT = new TextEditingController();
  TextEditingController controlnombreTienda = new TextEditingController();
  TextEditingController controldireccion= new TextEditingController();


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
                  child: Text("TENDERO",style: TextStyle(fontWeight:FontWeight.w900,fontSize: 20,color: Colors.red))
            
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: controlnombre,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: controlapellido,
                    decoration: InputDecoration(
                      labelText: 'Apellido',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: controlcorreo,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: controltelefono,
                    decoration: InputDecoration(
                      labelText: 'Telefono',
                    ),
                  ),
                ),
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
                Divider(
                  color: Color.fromRGBO(253, 188, 89, 1),
                  height: 40,
                  thickness: 2.5,
                  indent: 50,
                  endIndent: 50,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: Text("TIENDA",style: TextStyle(fontWeight:FontWeight.w900,fontSize: 20,color: Colors.red))
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: controlNIT,
                    decoration: InputDecoration(
                      labelText: 'NIT',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: controlnombreTienda,
                    decoration: InputDecoration(
                      labelText: 'Nombre de la tienda',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: controldireccion,
                    decoration: InputDecoration(
                      labelText: 'Direccion',
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(244, 48, 85, 1),
                        fixedSize: const Size(300, 50),
                      ),
                      onPressed: () {
                        var Tendero=<String,dynamic>{
                          'apellido': controlapellido.text,
                          'correo':controlcorreo.text,
                          'nombre':controlnombre.text,
                          'password': controlpassword.text,
                          'telefono': controltelefono.text
                        };
                        var Tienda=<String,dynamic>{
                          'NIT': controlNIT.text,
                          'direccion':controldireccion.text,
                          'idTendero': "",
                          'nombreTienda': controlnombreTienda.text,
                        };
                        //eticioneslogin().registrarTendero(Tendero, Tienda);
                        
                      },
                      child: Text(
                        'Registrar',
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
}