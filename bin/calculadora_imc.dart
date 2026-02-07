import 'dart:io';

import 'package:calculadora_imc/classes/apresentacao.dart';
import 'package:calculadora_imc/classes/pessoa.dart';

void main(List<String> arguments) {
  // Classe responsável pela apresentacao das informações na tela
  Apresentacao apresentacao = Apresentacao();

  apresentacao.informacoesIniciais(); // Apresentacao das informações iniciais

  // Coletando informações do Usuário
  stdout.write("Cadastro de Usuário\n");
  String nome = apresentacao.getNomeApresentacao(); // Coletando nome do terminal
  double peso = apresentacao.getPesoApresentacao(); // Coletando peso do terminar
  double altura = apresentacao.getAlturaApresentacao(); // Coletando altura do terminar

  Pessoa usuario = Pessoa(nome, peso, altura);
  print(usuario);
}
