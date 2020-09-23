import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoFinal;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacaoFinal, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacaoFinal < 3) {
      return 'Muito ruim, péssimo, cruzes! \nTe digo duas palavras: \nPara bens \nJogue novamente xD';
    } else if (pontuacaoFinal > 3 && pontuacaoFinal < 21) {
      return 'Patético! \nTe digo duas palavras: \nPara bens \nJogue novamente xD';
    } else if (pontuacaoFinal > 20 && pontuacaoFinal < 30) {
      return 'Achei que você era bom, só me decepcionou! \nTe digo duas palavras: \nPara bens \nJogue novamente xD';
    } else {
      return 'Agora sim, já ia levar um cascudo! \nTe digo duas palavras: \nPara bens \nJogue novamente xD';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 24, color: Colors.deepPurple),
          ),
        ),
        FlatButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text(
            'Reiniciar o Quiz',
            style: TextStyle(
              fontSize: 20,
              backgroundColor: Colors.deepPurple,
            ),
          ),
          textColor: Colors.deepPurple[50],
        )
      ],
    );
  }
}
