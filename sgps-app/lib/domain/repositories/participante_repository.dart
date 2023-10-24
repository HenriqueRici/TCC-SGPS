import 'package:dio/dio.dart';
import 'package:sgps/domain/providers/participante_provider.dart';
import '../models/participante.dart';

class ParticipanteRepository {
  final ParticipanteProvider provider;

  ParticipanteRepository({required this.provider});

  Future<Response> createParticipante(Participante participante) async {
    return await provider.createParticipante(participante);
  }

  Future<bool> checkCpf(String cpf) async {
    return await provider.checkCpf(cpf);
  }

  Future<Response> createParticipanteCadastrado(id, String cpf) async {
    return await provider.createParticipanteCadastrado(id, cpf);
  }

  Future<Participante> fetchParticipante(String cpf) async {
    return await provider.fetchParticipante(cpf);
  }

  Future<Response> updateParticipante(Participante participante) async {
    return await provider.updateParticipante(participante);
  }
}
