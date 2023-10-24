import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.20,
      child: Container(
        color: const Color.fromARGB(255, 62, 65, 68),
        child: _sidebar(context),
      ),
    );
  }

  Widget _sidebar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      color: const Color.fromRGBO(33, 35, 37, 1),
      child: Column(children: [
        _buildButton(context, "Início", Icons.home, '/'),
        _buildButton(context, "Área do Participante", Icons.person,
            '/login-participante'),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _buildButton(context, 'Administrador',
                Icons.admin_panel_settings, '/login-adm'),
          ),
        )
      ]),
    );
  }

  Widget _buildButton(
      BuildContext context, String label, IconData icon, String path) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton.icon(
          onPressed: () {
            Get.toNamed(
              path,
            );
          },
          icon: Icon(icon),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, double.infinity),
            side: const BorderSide(width: 2.0, color: Colors.white),
            backgroundColor: const Color.fromRGBO(33, 35, 37, 1),
          ),
        ),
      ),
    );
  }
}
