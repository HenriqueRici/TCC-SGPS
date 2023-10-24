import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgps/domain/repositories/participante_repository.dart';

import '../models/processo_seletivo.dart';
import '../repositories/processo_seletivo_repository.dart';

class ProcessoSeletivoController extends GetxController {
  TextEditingController editalController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  TextEditingController dataInicioInscricoes = TextEditingController();
  TextEditingController dataFimInscricoes = TextEditingController();
  TextEditingController dataInicioRetificacao = TextEditingController();
  TextEditingController dataFimRetificacao = TextEditingController();
  TextEditingController pathPdf = TextEditingController();
  TextEditingController hsInicioInscricoes = TextEditingController();
  TextEditingController hsFimInscricoes = TextEditingController();
  TextEditingController hsInicioRetificacao = TextEditingController();
  TextEditingController hsFimRetificacao = TextEditingController();
  TextEditingController anoReferenciaController = TextEditingController();

  final _seletivos$ = <ProcessoSeletivo>[].obs;
  final _participante = ''.obs;
  ProcessoSeletivoRepository repository;
  ParticipanteRepository participanteRepository;

  ProcessoSeletivoController(
      {required this.repository, required this.participanteRepository});

  RxList<ProcessoSeletivo> get seletivos$ => _seletivos$;

  @override
  void onInit() async {
    await fetchProcessosSeletivo();
    super.onInit();
  }

  @override
  void onReady() async {
    await fetchProcessosSeletivo();
    super.onReady();
  }

  void disposeDados() {
    editalController.clear();
    cargoController.clear();
    dataInicioInscricoes.clear();
    dataFimInscricoes.clear();
    dataInicioRetificacao.clear();
    dataFimRetificacao.clear();
    pathPdf.clear();
    hsInicioInscricoes.clear();
    hsFimInscricoes.clear();
    hsInicioRetificacao.clear();
    hsFimRetificacao.clear();
    anoReferenciaController.clear();
  }

  Future<void> create(ProcessoSeletivo processoSeletivo) async {
    await repository.createProcessoSeletivo(processoSeletivo);

    disposeDados();
  }

  Future<void> fetchProcessosSeletivo() async {
    var processoSeletivoList = await repository.fetchProcessoSeletivo();
    _seletivos$.assignAll(processoSeletivoList);
  }

  Future<bool> checkCpfByEdital(int id, String cpf) async {
    final response = await repository.checkCpfByEdital(id, cpf);
    return response;
  }

  Future<bool> checkCpf(String cpf) async {
    final response = await participanteRepository.checkCpf(cpf);
    return response;
  }

  Future<void> createParticipante(int id, String cpf) async {
    final response =
        await participanteRepository.createParticipanteCadastrado(id, cpf);
    _participante.value = response.data.toString();
  }

  Future<void> refificar(ProcessoSeletivo processoSeletivo) async {
    await repository.updateProcessoSeletivo(processoSeletivo);
  }

  ProcessoSeletivo dadosProcessoSeletivo() {
    return ProcessoSeletivo(
      edital: editalController.text,
      anoReferencia: int.parse(anoReferenciaController.text),
      cargo: cargoController.text,
      pathPdf: pathPdf.text,
      dataInicioInscricoes:
          '${dataInicioInscricoes.text} ${hsInicioInscricoes.text}',
      dataFimInscricoes: '${dataFimInscricoes.text} ${hsFimInscricoes.text}',
      dataInicioRetificacao:
          '${dataInicioRetificacao.text} ${hsInicioRetificacao.text}',
      dataFimRetificacao: '${dataFimRetificacao.text} ${hsFimRetificacao.text}',
    );
  }

  Future<void> fetchResultadoProcessosSeletivoById(int id) async {
    await repository.fetchResultadoProcessosSeletivoById(id);
  }

  Future<void> gerarResultadoProcessosSeletivoById(int id) async {
    await repository.gerarResultadoProcessosSeletivoById(id);
  }

  Future<void> validaParticipantesProcessosSeletivoById(int id) async {
    await repository.validaParticipantesProcessosSeletivoById(id);
  }
}
