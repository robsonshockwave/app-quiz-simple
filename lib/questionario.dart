import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  //como é stateless todos os atributos vão ser final
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    @required this.perguntas, //@required serva pra dizer que é obrigatório
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto']),
        /*
            RaisedButton(
              / /vai criar um botão
              child: Text(
                  'Resposta 1'), //criou um componente filho, que recebe outro widget
              onPressed:
                  _responder, //caso for clicado chama a função que está sendo passada como parâmetro
              / /se for passar uma função que retorna outra função precisa colocar (), só coloque uma função criada anteriormente se ela retornar outra função
            )*/
        //Respostas('Resposta 1', _responder)
        ...respostas.map((resp) {
          return Respostas(
              resp['texto'], () => quandoResponder(resp['pontuacao']));
        }).toList(),
      ],
    );
  }
}
