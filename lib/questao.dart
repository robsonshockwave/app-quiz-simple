import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  //como n tem acesso mais a pergunta vai esperar receber um valor pelo construtor do componente
  final String texto;

  Questao(this.texto); //construtor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 20,
          backgroundColor: Colors.deepPurple[50],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
