import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sgps/domain/controller/login_controller.dart';

class BodyLoginAdm extends GetView<LoginController> {
  const BodyLoginAdm({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return SizedBox(
        child: Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(children: [_cabecalho(context), _body(context)]),
      ),
    ));
  }

  _cabecalho(BuildContext context) {
    return Container(
      height: 80,
      color: const Color.fromRGBO(33, 35, 37, 1),
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: Text(
          'Login Administrador',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return Column(children: [
      Material(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 36.0, bottom: 16.0, left: 32.0, right: 32.0),
          child: TextField(
            controller: controller.usuario,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(14),
              MaskTextInputFormatter(
                  mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')})
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Login (CPF)',
            ),
          ),
        ),
      ),
      Material(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 32.0, right: 32.0),
          child: TextField(
            controller: controller.senha,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Senha',
            ),
          ),
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0, right: 32.0),
          child: ElevatedButton.icon(
            onPressed: () async {
              await handleLogin(context);
              controller.disposeDados();
            },
            icon: const Icon(
              Icons.login,
              size: 25,
            ),
            label: const Text('Entrar', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                width: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              backgroundColor: const Color.fromARGB(255, 16, 94, 172),
            ),
          ),
        ),
      ]),
    ]);
  }

  Future<void> handleLogin(BuildContext context) async {
    var response =
        await controller.login(controller.usuario.text, controller.senha.text);

    if (response == "ROLE_ADMINISTRADOR") {
      Get.toNamed('/adm-seletivos');
      return;
    }

    if (response == "ROLE_PARTICIPANTE") {
      if (context.mounted) {
        _showAlertDialog(
            context, 'Área do Administrador', 'Retorne a pagina inicial');
      }
      return;
    }
    if (context.mounted) {
      _showAlertDialog(
          context, 'Credenciais Inválidas', 'Insira os dados corretos');
    }
  }

  void _showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
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
