import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../models/processo_seletivo.dart';

//const api = 'http://localhost:8080/sgps';
const api = String.fromEnvironment('SGPS_API_URL', defaultValue: 'http://localhost:8080/sgps');

class ProcessoSeletivoProvider {
  final Dio dio;

  ProcessoSeletivoProvider({required this.dio});

  Future<List<ProcessoSeletivo>> fetchProcessoSeletivo() async {
    final response = await dio.get('$api/processo-seletivo');
    final model = response.data
        .map<ProcessoSeletivo>((data) => ProcessoSeletivo.fromJson(data))
        .toList();
    return model;
    //fazer tratamento de exceção
  }

  Future<bool> checkCpfByedital(int id, String cpf) async {
    final response =
        await dio.get('$api/processo-seletivo/$id/verifica-cpf/$cpf');
    Map<String, dynamic> status = jsonDecode(response.toString());
    return status['verificaCPFByEdital'];
  }

  Future<ProcessoSeletivo> fetchProcessoSeletivoById(int id) async {
    final response = await dio.get('$api/processo-seletivo/$id');
    final model = response.data
        .map<ProcessoSeletivo>((data) => ProcessoSeletivo.fromJson(data));
    return model;
  }

  Future<Response> createProcessoSeletivo(
      ProcessoSeletivo processoSeletivo) async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer $tokenBox";
    final response = await dio.post('$api/processo-seletivo',
        data: processoSeletivo.toJson());
    return response;
  }

  Future<Response> updateProcessoSeletivo(
      ProcessoSeletivo processoSeletivo) async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer $tokenBox";
    final response = await dio.put(
        '$api/processo-seletivo/${processoSeletivo.id}',
        data: processoSeletivo.toJson());

    return response;
  }

  Future<Response> fetchResultadoProcessosSeletivoById(int id) async {
    final response =
        await dio.get('$api/processo-seletivo/busca-resultado/$id');

    Map<String, dynamic> base64 = jsonDecode(response.toString());

    String fileName = 'ResultadoEdital.pdf';

    AnchorElement(
      href:
          'data:application/octet-stream;charset=utf-16le;base64,${base64['bytes']}',
    )
      ..setAttribute('download', fileName)
      ..click();

    return response;
  }

  Future<Response> gerarResultadoProcessosSeletivoById(int id) async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer $tokenBox";

    final response =
        await dio.post('$api/processo-seletivo/gera-resultado/$id');
    return response;
  }

  Future<Response> validaParticipantesProcessosSeletivoById(int id) async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer $tokenBox";
    final response =
        await dio.post('$api/processo-seletivo/valida-participantes/$id');

    return response;
  }
}
