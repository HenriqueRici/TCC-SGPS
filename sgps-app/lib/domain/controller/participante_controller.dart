import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgps/domain/models/participante.dart';
import 'package:sgps/domain/option.dart';
import 'package:sgps/domain/repositories/participante_repository.dart';

class ParticipanteController extends GetxController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController dataIngressoController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();
  // TextEditingController classeController = TextEditingController();
  // TextEditingController nivelController = TextEditingController();

  final RxString _selectedClasse = 'Selecione'.obs;
  final RxString _selectedNivel = 'Selecione'.obs;

  ParticipanteRepository repository;

  ParticipanteController({required this.repository});

  final _participante = ''.obs;
  String get response => _participante.value;

  List<Option<String>> get classes => [
        Option('Selecione', 'Selecione'),
        Option('A', 'A'),
        Option('B', 'B'),
        Option('C', 'C'),
        Option('D', 'D'),
        Option('E', 'E')
      ];

  List<Option<String>> get niveis => [
        Option('Selecione', 'Selecione'),
        Option('1', 'N001'),
        Option('2', 'N002'),
        Option('3', 'N003'),
        Option('4', 'N004'),
        Option('5', 'N005'),
        Option('6', 'N006'),
        Option('7', 'N007'),
        Option('8', 'N008'),
        Option('9', 'N009'),
        Option('10', 'N010'),
        Option('11', 'N011'),
        Option('12', 'N012'),
      ];

  RxString get classeSelecionada => _selectedClasse;

  RxString get nivelSelecionado => _selectedNivel;

  @override
  void onInit() async {
    nomeController = TextEditingController();
    cpfController = TextEditingController();
    dataNascimentoController = TextEditingController();
    dataIngressoController = TextEditingController();
    senhaController = TextEditingController();
    confirmarSenhaController = TextEditingController();
    super.onInit();
  }

  void disposeDados() {
    nomeController = TextEditingController();
    cpfController = TextEditingController();
    dataNascimentoController = TextEditingController();
    dataIngressoController = TextEditingController();
    senhaController = TextEditingController();
    confirmarSenhaController = TextEditingController();

    setSelectedValueClasse('Selecione');
    setSelectedValueNivel('Selecione');
  }

  Participante dadosParticipante(int idSeletivo) {
    return Participante(
        nome: nomeController.text,
        cpf: cpfController.text,
        confirmacaoCpf: cpfController.text,
        dataNascimento: dataNascimentoController.text,
        dataIngresso: dataIngressoController.text,
        senha: senhaController.text,
        confirmacaoSenha: confirmarSenhaController.text,
        classe: _selectedClasse.value,
        nivel: _selectedNivel.string,
        idProcessoSeletivo: idSeletivo);
  }

  Future<void> create(Participante participante) async {
    final response = await repository.createParticipante(participante);

    _participante.value = response.data.toString();
  }

  Future<bool> checkCpf(String cpf) async {
    final response = await repository.checkCpf(cpf);
    return response;
  }

  void setSelectedValueClasse(String selectedValue) {
    _selectedClasse.value = selectedValue;
  }

  void setSelectedValueNivel(String selectedValue) {
    _selectedNivel.value = selectedValue;
  }

  Future<Participante> fetchParticipante(String cpf) async {
    // corrigir metodo
    var a = await repository.fetchParticipante(cpf);
    return a;
  }
}
