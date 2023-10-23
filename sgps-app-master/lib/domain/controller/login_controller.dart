import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get_storage/get_storage.dart';

//const api = 'http://localhost:8080/sgps';
const api = String.fromEnvironment('SGPS_API_URL', defaultValue: 'http://localhost:8080/sgps');

class LoginController extends GetxController {
  final Dio dio;

  LoginController({required this.dio});

  TextEditingController usuario = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  void onInit() async {
    usuario = TextEditingController();
    senha = TextEditingController();
    super.onInit();
  }

  void disposeDados() {
    usuario.clear();
    senha.clear();
  }

  Future<String> login(String user, String password) async {
    try {
      Map params = {"login": user, "senha": password};
      var data = json.encode(params);

      var response = await dio.post('$api/usuarios/login', data: data);
      // print(response);
      Map<String, dynamic> token = jsonDecode(response.toString());
      var usuarioToken = token["token"];

      Map<String, dynamic> tokenDecodificado = JwtDecoder.decode(usuarioToken);

      dynamic listPerfil = tokenDecodificado["authorities"];

      String role = listPerfil[0]['authority'];

      GetStorage box = GetStorage();
      box.write('token', usuarioToken);
      return role;
    } catch (error) {
      if (error is DioError) {
        if (error.response!.statusCode == 403) {
          return 'Não Autorizado!';
        } else {
          return 'Erro desconhecido';
        }
      }
      return error.toString();
    }
  }
}
