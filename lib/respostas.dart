import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Respostas(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.deepPurple[200],
        textColor: Colors.deepPurple,
        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
