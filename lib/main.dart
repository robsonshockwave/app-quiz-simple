import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaAPP()); //passa o nó raiz

class _PerguntasAppState extends State<PerguntaAPP> {
  var _perguntaSelecionada =
      0; //aqui está trabalhando com estado dentro de um compondente sem estado, ou seja, estou trabalhando com var e não com final, o atributo pode ser modificado
  var _pontuacaoTotal = 0;

  //crinado uma lista de perguntas
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a minha cor favorita?',
      'respostas': [
        {'texto': 'Branco', 'pontuacao': 1},
        {'texto': 'Preto', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Laranja', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o meu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 1},
        {'texto': 'Dinossauro', 'pontuacao': 10},
        {'texto': 'Leão', 'pontuacao': 5},
        {'texto': 'Gato', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual a cor dos cabelos loiros de Maria?',
      'respostas': [
        {'texto': 'Marrom', 'pontuacao': 0},
        {'texto': 'Preto', 'pontuacao': 1},
        {'texto': 'Loiro', 'pontuacao': 10},
        {'texto': 'Bege', 'pontuacao': 5},
      ]
    },
  ];

  //o ideal é criar os métodos dentro da classe
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override //é um método que obrigatoriamente o componente Stateless precisa implementar, está sobescrevendo o método build e esse método quem vai chamar é o próprio flutter
  Widget build(BuildContext context) {
    //List<Widget> widgets = respostas.map((t) => Respostas(t, _responder)).toList(); //caso n quisesse colocar dentro da arvore, ali embaixo

    /*
    List<Widget> widgets = [];
    for (String textoResposta in perguntas[_perguntaSelecionada]['respostas']) {
      widgets.add(Respostas(textoResposta, _responder));
    }
    */

    //cada componente tem um contexto e ele é provido pelo próprio flutter
    return MaterialApp(
      //home: Text('Olá Mundo!!!!'), //parametro nomeado é o home: e dentro do Text() um parametro posicional, //o primeiro parametro que passa no Text é o valor do texto q ele vai assumir
      home: Scaffold(
        //Scaffold vai dar uma estrutura para a aplicação
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          //esse appBar cria a faixinha azul em cima
          title: Text('Perguntas'), //coloca um titulo dentro de AppBar
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    ); //está criando uma intância
  }
}

//recomendado que foque em componentes sem estados, passar por construtor no Stateless
//StatelessWidget que faz q PerguntaAPP se torne um widget
class PerguntaAPP extends StatefulWidget {
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
  /*Convertendo de Stateless pra Stateful
  1º: trocar a herança pra StatefulWidget, criou a classe PerguntasAppState que tem extends State na qual mostra qual Stateful estará ligado com ela
  2º: mudou a variavel que vai ficar mudando/de instancia pro State
  3º: mudou o método responder, tbm precisa do estado mudou pro State
  4º: mudou a arvore de componentes tbm pro status, pq vai ser preciso ficar mudando
  5º: criou dentro da classe PerguntaAPP a função PerguntasAppState create(){} na qual retorna o mesmo*/
}
