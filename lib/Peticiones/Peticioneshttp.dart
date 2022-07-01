import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_web/modelos/usuario.dart';

Future<List<Usuario>> listaUsuarios(http.Client client) async {
  final response = await client
      .get(Uri.parse("https://contenedorangelbola.000webhostapp.com/api/listar.php/"));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Usuario> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();
  return pasar.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}

void adicionarUsuario(Usuario usuario) async {
  var url = Uri.parse("https://contenedorangelbola.000webhostapp.com/api/listar.php/");

  await http.post(url, body: {
    'User': usuario.User,
    'Password': usuario.Password,
  });
}
Future<List<Usuario>> validarLogin(
    http.Client client, String User, String Password) async {
  var url =
      Uri.parse("https://contenedorangelbola.000webhostapp.com/api/login.php");

  final response = await http.post(url, body: {
    'User': User,
    'Password': Password,
  });

  return compute(pasaraListas2, response.body);
}

List<Usuario> pasaraListas2(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();
  return pasar.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}