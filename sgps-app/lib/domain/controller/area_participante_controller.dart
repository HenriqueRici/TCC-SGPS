import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sgps/domain/models/participante.dart';
import 'package:sgps/domain/option.dart';
import 'package:sgps/domain/repositories/participante_repository.dart';

class AreaParticipanteController extends GetxController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController dataIngressoController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();
  TextEditingController classeController = TextEditingController();
  TextEditingController nivelController = TextEditingController();

  final RxString selectedClasse = 'Selecione'.obs;
  final RxString selectedNivel = 'Selecione'.obs;

  ParticipanteRepository repository;

  AreaParticipanteController({required this.repository});

  final _participante$ = Participante().obs;

  Rx<Participante> get participante$ => _participante$;

  @override
  Future<void> onInit() async {
    await fetchParticipante(verificaArgumento());
    classeSelecionada.value = 'Selecione';
    nivelSelecionado.value = 'Selecione';
    super.onInit();
  }

  String verificaArgumento() {
    String token = GetStorage().read<String>('token').toString();
    Map<String, dynamic> tokenDecodificado = JwtDecoder.decode(token);
    String cpf = tokenDecodificado["sub"];
    return Get.arguments == null ? cpf : Get.arguments['login'];
  }

  Future<void> fetchParticipante(String cpf) async {
    var response = await repository.fetchParticipante(cpf);
    _participante$.value = response;
  }

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

  String converteNivel(String nivel) {
    var obj = niveis.firstWhere((element) => element.label == nivel);
    return obj.value.toString();
  }

  RxString get classeSelecionada => selectedClasse;

  RxString get nivelSelecionado => selectedNivel;

  void setSelectedValueClasse(String selectedValue) {
    selectedClasse.value = selectedValue;
  }

  void setSelectedValueNivel(String selectedValue) {
    selectedNivel.value = selectedValue;
  }

  Future<void> updateParticipante(Participante participante) async {
    await repository.updateParticipante(participante);
  }
}
