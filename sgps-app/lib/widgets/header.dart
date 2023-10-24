import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(33, 35, 37, 1),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white, width: 2.0, style: BorderStyle.solid),
              color: const Color.fromRGBO(33, 35, 37, 1),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: const Center(
                child: Text(
              'Sistema de Gerenciamento de Processo Seletivo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                decoration: TextDecoration.none,
              ),
            )),
          ),
        ));
  }
}
