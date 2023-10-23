import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sgps/domain/controller/area_participante_controller.dart';

import '../../domain/models/participante.dart';
import '../../domain/option.dart';

class BodyParticipante extends GetView<AreaParticipanteController> {
  const BodyParticipante({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.onInit(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    _cabecalho(context, 'Acompanhamento de Inscrições'),
                    _seletivosInscrito(context, controller.participante$.value),
                    _cabecalho(context, 'Dados Pessoais'),
                    //_bodyDadosParticipante(context)
                    _bodyDadosParticipante2(context)
                  ],
                ),
    );
  }

  Widget _cabecalho(BuildContext context, String label) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 62, 65, 68),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  _seletivosInscrito(BuildContext context, Participante participante) {
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 300.0;
    final crossAxisCount = (screenWidth / itemWidth).floor();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1,
        mainAxisExtent: 200,
      ),
      shrinkWrap: true,
      itemCount: participante.inscricoes!.length,
      itemBuilder: (context, index) {
        return _card(context, index, participante);
      },
    );
  }

  Widget _card(BuildContext context, int index, Participante participante) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 48.0,
              child: Center(
                child: Text(
                  'Edital ${participante.inscricoes?[index].editalProcessoSeletivo}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const Text(
                    'Situação:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Text(
                    '${participante.inscricoes?[index].situacaoInscricao}',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _retificarDados(BuildContext context, Participante participante) {
    TextEditingController nome = TextEditingController();
    TextEditingController cpf = TextEditingController();
    TextEditingController dtNascimento = TextEditingController();
    TextEditingController dtIngresso = TextEditingController();
    TextEditingController classe = TextEditingController();
    TextEditingController nivel = TextEditingController();

    nome.text = participante.nome.toString();
    cpf.text = participante.cpf.toString();
    dtNascimento.text = participante.dataNascimento.toString();
    dtIngresso.text = participante.dataIngresso.toString();
    classe.text = participante.classe.toString();
    nivel.text = participante.nivel.toString();

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _textFieldBuild(nome, 'Nome', false, false, true),
                    ),
                    Expanded(
                      child: _textFieldBuild(cpf, 'CPF', false, false, false),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _textFieldBuild(
                          dtNascimento, 'Data Nascimento', false, true, true),
                    ),
                    Expanded(
                      child: _textFieldBuild(
                          dtIngresso, 'Data Ingresso', false, true, true),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _dropdownButtonClasse(),
                    _dropdownButtonNivel(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      var update = Participante(
                        id: controller.participante$.value.id,
                        nome: nome.text,
                        dataNascimento: dtNascimento.text,
                        dataIngresso: dtIngresso.text,
                      );

                      if (controller.classeSelecionada.toString() ==
                          'Selecione') {
                        update.classe = controller.participante$.value.classe;
                      } else {
                        update.classe = controller.classeSelecionada.string;
                      }

                      if (controller.nivelSelecionado.toString() ==
                          'Selecione') {
                        update.nivel = controller.converteNivel(
                            controller.participante$.value.nivel!);
                      } else {
                        update.nivel = controller.nivelSelecionado.string;
                      }

                      await controller.updateParticipante(update);

                      await controller.fetchParticipante(
                          controller.participante$.value.cpf!);
                      if (context.mounted) {
                        Navigator.pop(context);
                        _showAlertDialog(
                            context,
                            'Participante Alterado com Sucesso!',
                            'Aperte "OK"');
                      }
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 35,
                    ),
                    label:
                        const Text('Alterar', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 2.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      backgroundColor: const Color.fromARGB(255, 224, 5, 5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _data(String label1, String atributo1, String label2, String atributo2) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Row(
        children: [
          Text(
            label1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 8.0, left: 8.0)),
          Text(
            atributo1,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 48.0, left: 48.0)),
          Text(
            label2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 8.0, left: 8.0)),
          Text(
            atributo2,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }

  _showAlertDialog(BuildContext context, String title, String subTitle) {
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

  Widget _textFieldBuild(TextEditingController controllerField, String label,
      bool senha, bool data, bool editavel) {
    MaskTextInputFormatter dateFormatter =
        MaskTextInputFormatter(mask: '##/##/####');
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 24.0, bottom: 16.0, left: 32.0, right: 32.0),
        child: TextField(
          controller: controllerField,
          inputFormatters: data ? [dateFormatter] : null,
          enabled: editavel,
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
                value: controller.participante$.value.classe,
                items: controller.classes.map((Option<String> e) {
                  return DropdownMenuItem<String>(
                    value: e.value,
                    child: Text(e.label),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  controller.setSelectedValueClasse(selectedValue!);
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
                value: controller
                    .converteNivel(controller.participante$.value.nivel!),
                items: controller.niveis.map((Option<String> e) {
                  return DropdownMenuItem<String>(
                    value: e.value,
                    child: Text(e.label),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  controller.setSelectedValueNivel(selectedValue!);
                });
          }),
        ),
      ),
    );
  }

  _bodyDadosParticipante2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Obx(() => _data('Nome:', controller.participante$.value.nome!,
                'CPF:', controller.participante$.value.cpf!)),
            Obx(() => _data(
                'Data Nascimento:',
                controller.participante$.value.dataNascimento!,
                'Data Ingresso:',
                controller.participante$.value.dataIngresso!)),
            Obx(() => _data('Classe:', controller.participante$.value.classe!,
                'Nível:', controller.participante$.value.nivel!)),
            const SizedBox(
              height: 75.0,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await _retificarDados(context, controller.participante$.value);
              },
              icon: const Icon(
                Icons.edit_outlined,
                size: 35,
              ),
              label:
                  const Text('Alterar Dados', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 2.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                backgroundColor: const Color.fromARGB(255, 224, 5, 5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
