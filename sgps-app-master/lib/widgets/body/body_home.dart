import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sgps/domain/controller/processo_seletivo_controller.dart';
import 'package:sgps/domain/models/processo_seletivo.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyHome extends GetView<ProcessoSeletivoController> {
  BodyHome({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return SizedBox(
      child: Flex(
        direction: Axis.vertical,
        children: [_bodyHome(context)],
      ),
    );
  }

  Widget _bodyHome(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 62, 65, 68),
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              children: [
                Text(
                  'Processo(s) Seletivo(s)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'Abaixo estão listados os editais disponíveis',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              color: const Color.fromARGB(255, 62, 65, 68),
              child: Obx(() =>
                  _buildListView(context, controller.seletivos$.toList())),
            ),
          ),
        ],
      ),
    );
  }

  _buildListView(BuildContext context, List<ProcessoSeletivo> seletivos) {
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 400.0; // Largura desejada para cada item
    final crossAxisCount = (screenWidth / itemWidth).floor();
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1,
          mainAxisExtent: 520,
        ),
        shrinkWrap: true,
        itemCount: seletivos.length,
        itemBuilder: ((context, index) {
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
                        'Informações do Edital',
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
                      ListTile(
                        leading: const Text(
                          'Cargo:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        trailing: Text(
                          '${seletivos[index].cargo}',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Periodo de Inscrições:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'De: ${seletivos[index].dataInicioInscricoes} Hs',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  'Até: ${seletivos[index].dataFimInscricoes} Hs',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Periodo de Retificações:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'De: ${seletivos[index].dataInicioRetificacao} Hs',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                'Até: ${seletivos[index].dataFimRetificacao} Hs',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ListTile(
                        title: const Text(
                          'Edital Completo:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        trailing: ElevatedButton.icon(
                          onPressed: () async {
                            final Uri url =
                                Uri.parse('${seletivos[index].pathPdf}');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          },
                          icon: const Icon(Icons.picture_as_pdf_outlined),
                          label: const Text('Download'),
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 16, 94, 172),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _inscreverSe(context, seletivos, index),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          controller.fetchResultadoProcessosSeletivoById(
                              seletivos[index].id!);
                        },
                        icon: const Icon(Icons.download),
                        label: const Text('Resultado do Edital'),
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: 2.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 11, 117, 11),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }

  ListTile _inscreverSe(
      BuildContext context, List<ProcessoSeletivo> seletivos, int index) {
    return ListTile(
      trailing: ElevatedButton.icon(
        onPressed: checkPeriodoInscricoes(seletivos, index)
            ? () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Text('Informe seu CPF:'),
                      content: TextField(
                        controller: _textEditingController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(14),
                          MaskTextInputFormatter(
                              mask: '###.###.###-##',
                              filter: {'#': RegExp(r'[0-9]')})
                        ],
                        decoration:
                            const InputDecoration(hintText: 'Apenas Números'),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            if (!CPFValidator.isValid(
                                _textEditingController.text)) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext builder) {
                                    return AlertDialog(
                                      title: const Text('CPF inválido!'),
                                      content:
                                          const Text('Informe um CPF valido!!'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              if (await controller.checkCpfByEdital(
                                  seletivos[index].id!,
                                  _textEditingController.text)) {
                                if (context.mounted) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Esse CPF já consta inscrito no Edital selecionado!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                _textEditingController.text =
                                                    '';
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      });
                                }
                              } else if (await controller
                                  .checkCpf(_textEditingController.text)) {
                                if (context.mounted) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Este CPF já consta inscrito em outro Edital!'),
                                          content: const Text(
                                              'Deseja se inscrever nesse Edital tambem?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () async {
                                                await controller
                                                    .createParticipante(
                                                        seletivos[index].id!,
                                                        _textEditingController
                                                            .text);
                                                _textEditingController.text =
                                                    '';
                                                if (context.mounted) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          builder) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Inscrição fetita com sucesso'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'OK'),
                                                            )
                                                          ],
                                                        );
                                                      });
                                                  //confirmar cadastro
                                                }
                                              },
                                              child: const Text('Sim'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                _textEditingController.text =
                                                    '';
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Não'),
                                            ),
                                          ],
                                        );
                                      });
                                }
                              } else {
                                Get.toNamed('/inscricoes', arguments: {
                                  'idSeletivo': '${seletivos[index].id}',
                                  'cpf': _textEditingController.text
                                });
                                _textEditingController.text = '';
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 16, 94, 172),
                          ),
                          child: const Text('Verificar'),
                        ),
                      ],
                    );
                  }),
                );
              }
            : null,
        icon: const Icon(Icons.add),
        label: const Text('Inscrever-se'),
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            width: 2.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          backgroundColor: const Color.fromARGB(255, 16, 94, 172),
        ),
      ),
    );
  }

  bool checkPeriodoInscricoes(List<ProcessoSeletivo> seletivos, int index) {
    bool isButtonClickable;

    String dtInicio = seletivos[index].dataInicioInscricoes.toString();
    String dtFim = seletivos[index].dataFimInscricoes.toString();
    DateTime dataInicioFormatado =
        DateFormat('dd/MM/yyyy HH:mm').parse(dtInicio);
    DateTime dataFimFormatado = DateFormat('dd/MM/yyyy HH:mm').parse(dtFim);
    if (DateTime.now().isAfter(dataInicioFormatado) &&
        DateTime.now().isBefore(dataFimFormatado)) {
      isButtonClickable = true;
    } else {
      isButtonClickable = false;
    }
    return isButtonClickable;
  }
}
