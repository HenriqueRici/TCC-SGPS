import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(33, 35, 37, 1),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white, width: 2.0, style: BorderStyle.solid),
              color: const Color.fromRGBO(33, 35, 37, 1),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            child: const Center(
                child: Text(
              'By Carlos Henrique Rici Conceição',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            )),
          ),
        ));
  }
}
