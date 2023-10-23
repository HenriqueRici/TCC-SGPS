import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sgps/domain/controller/processo_seletivo_controller.dart';

import '../../domain/models/processo_seletivo.dart';

class BodySeletivo extends GetView<ProcessoSeletivoController> {
  const BodySeletivo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            _cabecalho(context, 'Criar um novo Edital'),
            _criarNovoSeletivo(context),
            _cabecalho(context, 'Editais Publicados'),
            Obx(() => _seletivosPublicados(context)),
          ],
        ),
      ],
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

  Widget _seletivosPublicados(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 400.0;
    final crossAxisCount = (screenWidth / itemWidth).floor();
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1,
          mainAxisExtent: 300,
        ),
        shrinkWrap: true,
        itemCount: controller.seletivos$.toList().length,
        itemBuilder: (context, index) {
          return _card(context, index, controller.seletivos$.toList());
        });
  }

  Widget _card(
      BuildContext context, int index, List<ProcessoSeletivo> seletivos) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 48.0,
              child: Center(
                child: Text(
                  'Edital Publicado',
                  style: TextStyle(
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
                    'Edital:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Text(
                    '${seletivos[index].edital}',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    await _retificarEdital(context, index, seletivos);
                  },
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 35,
                  ),
                  label:
                      const Text('Retificar', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 212, 90, 8),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    controller.validaParticipantesProcessosSeletivoById(
                        seletivos[index].id!);
                    showAlertDialog(context,
                        'Participantes Validados com Sucesso!', 'Aperte "OK"');
                  },
                  icon: const Icon(
                    Icons.check,
                    size: 35,
                  ),
                  label: const Text('Validar Participantes',
                      style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 16, 94, 172),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    controller.gerarResultadoProcessosSeletivoById(
                        seletivos[index].id!);
                    showAlertDialog(
                        context, 'Resultado com Sucesso!', 'Aperte "OK"');
                  },
                  icon: const Icon(
                    Icons.picture_as_pdf_outlined,
                    size: 35,
                  ),
                  label: const Text('Gerar Resultado',
                      style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 7, 116, 22),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _criarNovoSeletivo(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _textFieldBuild(controller.editalController, 'Edital',
                  false, true, false, false),
            ),
            Expanded(
              child: _textFieldBuild(controller.anoReferenciaController,
                  'Ano Referência', false, true, false, false),
            ),
            Expanded(
              child: _textFieldBuild(controller.cargoController, 'Cargo', false,
                  true, false, false),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _textFieldBuild(controller.pathPdf, 'Caminho PDF Edital',
                  false, true, false, false),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _textFieldBuild(controller.dataInicioInscricoes,
                  'Data Inicio Inscrições', false, true, true, false),
            ),
            Expanded(
              child: _textFieldBuild(controller.hsInicioInscricoes,
                  'Hora Inicio Inscrições', false, true, false, true),
            ),
            Expanded(
              child: _textFieldBuild(controller.dataFimInscricoes,
                  'Data Fim Inscrições', false, true, true, false),
            ),
            Expanded(
              child: _textFieldBuild(controller.hsFimInscricoes,
                  'Hora Fim Inscrições', false, true, false, true),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _textFieldBuild(controller.dataInicioRetificacao,
                  'Data Inicio Retificações', false, true, true, false),
            ),
            Expanded(
              child: _textFieldBuild(controller.hsInicioRetificacao,
                  'Hora Inicio Retificações', false, true, false, true),
            ),
            Expanded(
              child: _textFieldBuild(controller.dataFimRetificacao,
                  'Data Fim Retificações', false, true, true, false),
            ),
            Expanded(
              child: _textFieldBuild(controller.hsFimRetificacao,
                  'Hora Fim Retificações', false, true, false, true),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () async {
              if (_validaCampos(context)) {
                controller.create(controller.dadosProcessoSeletivo());
                showAlertDialog(
                    context,
                    'Edital ${controller.editalController.text} Criado com Sucesso!',
                    'Aperte "OK"');
                controller.fetchProcessosSeletivo();
              }
              controller.onInit();
            },
            icon: const Icon(
              Icons.add,
              size: 35,
            ),
            label:
                const Text('Registrar Edital', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                width: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              backgroundColor: const Color.fromARGB(255, 7, 116, 22),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textFieldBuild(TextEditingController controllerField, String label,
      bool senha, bool enabled, bool data, bool hs) {
    MaskTextInputFormatter dateFormatter =
        MaskTextInputFormatter(mask: '##/##/####');

    MaskTextInputFormatter hsFormatter =
        MaskTextInputFormatter(mask: '##:##:##');

    return Material(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 24.0, bottom: 16.0, left: 32.0, right: 32.0),
        child: TextField(
          controller: controllerField,
          inputFormatters: data ? [dateFormatter] : (hs ? [hsFormatter] : null),
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

  bool _validaCampos(BuildContext context) {
    if (controller.editalController.text.isEmpty) {
      showAlertDialog(
          context, 'Dados Inválidos', 'O campo "Edital" é requerido!');
      return false;
    } else if (controller.anoReferenciaController.text.isEmpty) {
      showAlertDialog(
          context, 'Dados Inválidos', 'O campo "Ano Referência" é requerido!');
      return false;
    } else if (controller.cargoController.text.isEmpty) {
      showAlertDialog(
          context, 'Dados Inválidos', 'O campo "Cargo" é requerido!');
      return false;
    } else if (controller.pathPdf.text.isEmpty) {
      showAlertDialog(
          context, 'Dados Inválidos', 'Caminho PDF Edital" é requerido!');
      return false;
    } else if (controller.dataInicioInscricoes.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'O campo "Data Inicio Inscrições" é requerido!');
      return false;
    } else if (controller.hsInicioInscricoes.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'Os campos "Senha" e "Hora Inicio Inscrições" não são iguais!');
      return false;
    } else if (controller.dataFimInscricoes.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'O campo "Data Fim Inscrições" é requerido!');
      return false;
    } else if (controller.hsFimInscricoes.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'Os campos "Senha" e "Hora Fim Inscrições" não são iguais!');
      return false;
    } else if (controller.dataInicioRetificacao.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'O campo "Data Inicio Retificações" é requerido!');
      return false;
    } else if (controller.hsInicioRetificacao.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'Os campos "Senha" e "Hora Inicio Retificações" não são iguais!');
      return false;
    } else if (controller.dataFimRetificacao.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'O campo "Data Fim Retificações" é requerido!');
      return false;
    } else if (controller.hsFimRetificacao.text.isEmpty) {
      showAlertDialog(context, 'Dados Inválidos',
          'Os campos "Senha" e "Hora Fim Retificações" não são iguais!');
      return false;
    }
    return true;
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

  _retificarEdital(
      BuildContext context, int index, List<ProcessoSeletivo> seletivos) {
    TextEditingController edital = TextEditingController();
    TextEditingController anoReferencia = TextEditingController();
    TextEditingController cargo = TextEditingController();
    TextEditingController caminhopdf = TextEditingController();
    TextEditingController dtInicioInscricao = TextEditingController();
    TextEditingController dtFimInscricao = TextEditingController();
    TextEditingController hsInicioInscricao = TextEditingController();
    TextEditingController hsFimInscricao = TextEditingController();
    TextEditingController dtInicioRetificacao = TextEditingController();
    TextEditingController dtFimRetificacao = TextEditingController();
    TextEditingController hsInicioRetificacao = TextEditingController();
    TextEditingController hsFimRetificacao = TextEditingController();
    edital.text = seletivos[index].edital.toString();
    anoReferencia.text = seletivos[index].anoReferencia.toString();
    cargo.text = seletivos[index].cargo.toString();
    caminhopdf.text = seletivos[index].pathPdf.toString();
    List<String> inicioInscricao =
        seletivos[index].dataInicioInscricoes.toString().split(' ');
    dtInicioInscricao.text = inicioInscricao[0];
    hsInicioInscricao.text = '${inicioInscricao[1]}:00';

    List<String> fimInscricao =
        seletivos[index].dataFimInscricoes.toString().split(' ');
    dtFimInscricao.text = fimInscricao[0];
    hsFimInscricao.text = '${fimInscricao[1]}:00';

    List<String> inicioRetificacao =
        seletivos[index].dataInicioInscricoes.toString().split(' ');
    dtInicioRetificacao.text = inicioRetificacao[0];
    hsInicioRetificacao.text = '${inicioRetificacao[1]}:00';

    List<String> fimRetificacao =
        seletivos[index].dataFimRetificacao.toString().split(' ');
    dtFimRetificacao.text = fimRetificacao[0];
    hsFimRetificacao.text = '${fimRetificacao[1]}:00';

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.height * 0.70,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _textFieldBuild(
                          edital, 'Edital', false, false, false, false),
                    ),
                    Expanded(
                      child: _textFieldBuild(anoReferencia, 'Ano Referência',
                          false, false, false, false),
                    ),
                    Expanded(
                      child: _textFieldBuild(
                          cargo, 'Cargo', false, false, false, false),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _textFieldBuild(caminhopdf, 'Caminho PDF Edital',
                          false, true, false, false),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _textFieldBuild(dtInicioInscricao,
                          'Data Inicio Inscrições', false, true, true, false),
                    ),
                    Expanded(
                      child: _textFieldBuild(hsInicioInscricao,
                          'Hora Inicio Inscrições', false, true, false, true),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _textFieldBuild(dtFimInscricao,
                          'Data Fim Inscrições', false, true, true, false),
                    ),
                    Expanded(
                      child: _textFieldBuild(hsFimInscricao,
                          'Hora Fim Inscrições', false, true, false, true),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _textFieldBuild(dtInicioRetificacao,
                          'Data Inicio Retificações', false, true, true, false),
                    ),
                    Expanded(
                      child: _textFieldBuild(hsInicioRetificacao,
                          'Hora Inicio Retificações', false, true, false, true),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _textFieldBuild(dtFimRetificacao,
                          'Data Fim Retificações', false, true, true, false),
                    ),
                    Expanded(
                      child: _textFieldBuild(hsFimRetificacao,
                          'Hora Fim Retificações', false, true, false, true),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      var seletivoRetificado = ProcessoSeletivo(
                        id: seletivos[index].id,
                        edital: edital.text,
                        anoReferencia: int.parse(anoReferencia.text),
                        pathPdf: caminhopdf.text,
                        cargo: cargo.text,
                        dataInicioInscricoes:
                            '${dtInicioInscricao.text} ${hsInicioInscricao.text}',
                        dataFimInscricoes:
                            '${dtFimInscricao.text} ${hsFimInscricao.text}',
                        dataInicioRetificacao:
                            '${dtInicioRetificacao.text} ${hsInicioRetificacao.text}',
                        dataFimRetificacao:
                            '${dtFimRetificacao.text} ${hsFimRetificacao.text}',
                      );

                      controller.refificar(seletivoRetificado);

                      Navigator.pop(context);
                      showAlertDialog(
                          context,
                          'Edital ${controller.editalController.text} Retificado com Sucesso!',
                          'Aperte "OK"');
                      controller.fetchProcessosSeletivo();
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 35,
                    ),
                    label:
                        const Text('Retificar', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 2.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      backgroundColor: const Color.fromARGB(255, 212, 90, 8),
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
}
