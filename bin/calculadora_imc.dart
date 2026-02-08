import 'dart:io';
import 'dart:math';

import 'package:calculadora_imc/classes/apresentacao.dart';
import 'package:calculadora_imc/classes/pessoa.dart';

void main(List<String> arguments) {
  // Classe responsável pela apresentacao das informações na tela
  Apresentacao apresentacao = Apresentacao(stdin: stdin, stdout: stdout);

  apresentacao.informacoesIniciais(); // Apresentacao das informações iniciais

  // Coletando informações do Usuário
  stdout.write("Cadastro de Usuário\n");
  String nome = apresentacao.getNomeApresentacao(); // Coletando nome do terminal
  double peso = apresentacao.getPesoApresentacao(); // Coletando peso do terminar
  double altura = apresentacao.getAlturaApresentacao(); // Coletando altura do terminar

  Pessoa usuario = Pessoa(nome, peso, altura);
  
  stdout.write("Calculando seu IMC .....\n\n");
  double imc = (usuario.getPeso() / (pow(usuario.getAltura(), 2)));
  String descricaoImc = "";
  switch (imc) {
    case < 16:
      descricaoImc = "Magreza grave";
      break;
    case < 17:
      descricaoImc = "Magreza moderada";
      break;
    case < 18.5:
      descricaoImc = "Magreza leve";
      break;
    case < 25:
      descricaoImc = "Saudável";
      break;
    case < 30:
      descricaoImc = "Sobrepeso";
      break;
    case < 35:
      descricaoImc = "Obesidade Grau 1";
      break;
    case < 40:
      descricaoImc = "Obesidade Grau 2 (severa)";
      break;
    default:
      descricaoImc = "Obesidade Grau 3 (mórbida)";
      break;
  }

  apresentacao.apresentaResultado(nome, peso, altura, imc, descricaoImc);

}
