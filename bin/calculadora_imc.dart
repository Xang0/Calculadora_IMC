import 'dart:io';

import 'package:calculadora_imc/classes/pessoa.dart';

void main(List<String> arguments) {
  stdout.write("Bem-vindo(a/e) à Calculadora de IMC");
  stdout.write("O IMC - Índice de Massa Corporal é uma forma simples de identificar problemas relacionados ao peso, como obesidade ou desnutrição em crianças, adolescentes, adultos e idosos.");
  stdout.write("Fórmula: IMC = Peso(Kg) / Altura²(metros)");
  stdout.write("Segue a tabela com os valores e classificações:\n");

  stdout.write("   |------------------------------------------|");
  stdout.write("   |    IMC    |         Classificação        |");
  stdout.write("   |-----------|------------------------------|");
  stdout.write("   |    < 16   |  Magreza moderada            |");
  stdout.write("   |-----------|------------------------------|");
  stdout.write("   |  17 a 16  |  Magreza moderada            |");
  stdout.write("   |-----------|------------------------------|");
  stdout.write("   | 17 a 18.5 |  Magreza leve                |");
  stdout.write("   |-----------|------------------------------|");
  stdout.write("   | 18.5 a 25 |  Saudável                    |");
  stdout.write("   |-----------|------------------------------|");
  stdout.write("   |  25 a 30  |  Sobrepeso                   |");
  stdout.write("   |-----------|------------------------------|");
  stdout.write("   |  30 a 35  |  Obesidade Grau 1            |");
  stdout.write("   |-----------|------------------------------|");
  stdout.write("   |  35 a 40  |  Obesidade Grau 2 (severa)   |");
  stdout.write("   |-----------|------------------------------|");
  stdout.write("   |   >= 40   |  Obesidade Grau 3 (mórbida)  |");
  stdout.write("   |------------------------------------------|\n");

  stdout.write("Cadastro de Usuário");

  bool correto = false;
  dynamic entrada;
  String nome = "";
  double peso = 0.0;
  double altura = 0.0;

  // Coletando nome do terminal
  while (!correto) {
    stdout.write("Digite seu nome:");
    entrada = stdin.readLineSync().toString().trim();

    if (entrada != null) {
      nome = entrada;

      try {
        int.parse(entrada);

        print("");
        print("Nome é um valor numérico: favor digitar um valor válido.");
      } catch(err) {
        nome = entrada;
        correto = true;
      }
    } else {
      print("");
      print("Nome está em branco: favor digitar um valor válido.");
    }
  }
  correto = false;

  // Coletando peso do terminar
  while (!correto) {
    stdout.write("Digite seu peso (use . para separar os inteiros dos decimais):");
    entrada = stdin.readLineSync().toString().trim();

    if (entrada != null) {
      try {
        peso = double.parse(entrada);
      } catch (err) {
        print("");
        print("Peso não é um número: favor digitar um valor válido.");
      }

      if (peso <= 0.0) {
        print("");
        print("Peso é um valor menor ou igual a zero: favor digitar um valor válido.");
        peso = 0.0;
      } else {
        correto = true;
      }
    } else {
      print("");
      print("Peso está em branco: favor digitar um valor válido.");
    }
  }
  correto = false;

  // Coletando altura do terminar
  while (!correto) {
    stdout.write("Digite seu altura (use . para separar os inteiros dos decimais):");
    entrada = stdin.readLineSync().toString().trim();

    if (entrada != null) {
      try {
        altura = double.parse(entrada);
      } catch (err) {
        print("");
        print("Peso não é um número: favor digitar um valor válido.");
      }

      if (altura <= 0.0) {
        print("");
        print("Peso é um valor menor ou igual a zero: favor digitar um valor válido.");
        peso = 0.0;
      } else {
        correto = true;
      }
    } else {
      print("");
      print("Peso está em branco: favor digitar um valor válido.");
    }
  }

  Pessoa usuario = Pessoa(nome, peso, altura);
  print(usuario);
}
