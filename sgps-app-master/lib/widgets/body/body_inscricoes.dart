import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sgps/domain/controller/participante_controller.dart';
import 'package:sgps/domain/option.dart';

class BodyInscricoes extends GetView<ParticipanteController> {
  const BodyInscricoes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 62, 65, 68),
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              children: [
                Text(
                  'Cadastro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'Informe Seus Dados Pessoais',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          _bodyInscricoes(context)
        ],
      ),
    );
  }

  Widget _bodyInscricoes(BuildContext context) {
    controller.cpfController.text = Get.arguments['cpf'];
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _textFieldBuild(
                      controller.nomeController, 'Nome', false, true, false),
                ),
                Expanded(
                  child: _textFieldBuild(
                      controller.cpfController, 'CPF', false, false, false),
                ),
              ],
            ),
            Row(children: [
              Expanded(
                child: _textFieldBuild(controller.dataNascimentoController,
                    'Data de Nascimento', false, true, true),
              ),
              Expanded(
                child: _textFieldBuild(controller.dataIngressoController,
                    'Data de Ingresso', false, true, true),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  child: _textFieldBuild(
                      controller.senhaController, 'Senha', true, true, false),
                ),
                Expanded(
                  child: _textFieldBuild(controller.confirmarSenhaController,
                      'Confimação de Senha', true, true, false),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Classe',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        _dropdownButtonClasse(),
                      ]),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Nível',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      _dropdownButtonNivel(),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 32.0)),
            ElevatedButton.icon(
              onPressed: () async {
                _validaCampos(context);
                await controller.create(controller
                    .dadosParticipante(int.parse(Get.arguments['idSeletivo'])));
                controller.disposeDados();
                Get.toNamed('/');
              },
              icon: const Icon(
                Icons.add,
                size: 35,
              ),
              label: const Text('Inscrever-se', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 2.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                backgroundColor: const Color.fromARGB(255, 16, 94, 172),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldBuild(TextEditingController controllerField, String label,
      bool senha, bool enabled, bool data) {
    MaskTextInputFormatter dateFormatter =
        MaskTextInputFormatter(mask: '##/##/####');

    return Material(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 24.0, bottom: 16.0, left: 32.0, right: 32.0),
        child: TextField(
          controller: controllerField,
          inputFormatters: data ? [dateFormatter] : null,
          enabled: enabled,
          obscureText: senha,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
        ),
      ),
    );
  }

  Widget _dropdownButtonClasse() {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: SizedBox(
        width: 150.0,
        child: Material(
          child: Obx(() {
            return DropdownButtonFormField<String>(
                value: controller.classeSelecionada.string,
                items: controller.classes.map((Option<String> e) {
                  return DropdownMenuItem<String>(
                    value: e.value,
                    child: Text(e.label),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  if (selectedValue != 'Selecione') {
                    controller.setSelectedValueClasse(selectedValue ?? '');
                  }
                });
          }),
        ),
      ),
    );
  }

  Widget _dropdownButtonNivel() {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: SizedBox(
        width: 150.0,
        child: Material(
          child: Obx(() {
            return DropdownButtonFormField<String>(
                value: controller.nivelSelecionado.string,
                items: controller.niveis.map((Option<String> e) {
                  return DropdownMenuItem<String>(
                    value: e.value,
                    child: Text(e.label),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  if (selectedValue != 'Selecione') {
                    controller.setSelectedValueNivel(selectedValue ?? '');
                  }
                });
          }),
        ),
      ),
    );
  }

  _validaCampos(BuildContext context) {
    if (controller.nomeController.text.isEmpty) {
      showAlertDialog(
          context, 'Dados Inválidos', 'O campo "Nome" é requerido!');
    } else if (controller.dataNascimentoController.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'O campo "Data de Nascimento" é requerido!');
    } else if (controller.dataIngressoController.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'O campo "Data de Inngresso" é requerido!');
    } else if (controller.senhaController.text.isEmpty) {
      showAlertDialog(
          context, 'Dados Inválidos', 'O campo "Senha" é requerido!');
    } else if (controller.confirmarSenhaController.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'O campo "Confirmação de Senha" é requerido!');
    } else if (!(controller.senhaController.text ==
        controller.confirmarSenhaController.text)) {
      showAlertDialog(context, 'Dados Inválidos',
          'Os campos "Senha" e "Confirmação de Senha" não são iguais!');
    } else if (controller.classeSelecionada.string == 'Selecione') {
      showAlertDialog(
          context, 'Dados Inválidos', 'O campo "Classe" é requerido!');
    } else if (controller.nivelSelecionado.string == 'Selecione') {
      showAlertDialog(
          context, 'Dados Inválidos', 'O campo "Nível" é requerido!');
    }
  }

  showAlertDialog(BuildContext context, String title, String subTitle) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(subTitle),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}
