import 'dart:io';

class Apresentacao {
  bool _dadoCorreto = false;
  dynamic _entrada;

  void informacoesIniciais() {
    stdout.write("Bem-vindo(a/e) à Calculadora de IMC\n\n");
    stdout.write("O IMC - Índice de Massa Corporal é uma forma simples de identificar problemas relacionados ao peso, como obesidade ou desnutrição em crianças, adolescentes, adultos e idosos.\n");
    stdout.write("Fórmula: IMC = Peso(Kg) / Altura²(metros)\n");
    stdout.write("Segue a tabela com os valores e classificações:\n\n");

    stdout.write("   |------------------------------------------|\n");
    stdout.write("   |    IMC    |         Classificação        |\n");
    stdout.write("   |-----------|------------------------------|\n");
    stdout.write("   |    < 16   |  Magreza moderada            |\n");
    stdout.write("   |-----------|------------------------------|\n");
    stdout.write("   |  17 a 16  |  Magreza moderada            |\n");
    stdout.write("   |-----------|------------------------------|\n");
    stdout.write("   | 17 a 18.5 |  Magreza leve                |\n");
    stdout.write("   |-----------|------------------------------|\n");
    stdout.write("   | 18.5 a 25 |  Saudável                    |\n");
    stdout.write("   |-----------|------------------------------|\n");
    stdout.write("   |  25 a 30  |  Sobrepeso                   |\n");
    stdout.write("   |-----------|------------------------------|\n");
    stdout.write("   |  30 a 35  |  Obesidade Grau 1            |\n");
    stdout.write("   |-----------|------------------------------|\n");
    stdout.write("   |  35 a 40  |  Obesidade Grau 2 (severa)   |\n");
    stdout.write("   |-----------|------------------------------|\n");
    stdout.write("   |   >= 40   |  Obesidade Grau 3 (mórbida)  |\n");
    stdout.write("   |------------------------------------------|\n\n");
  }

  String getNomeApresentacao() {
    String nome = "";

    while (!_dadoCorreto) {
      stdout.write("Digite seu nome:");
      _entrada = stdin.readLineSync().toString().trim();

      if (_entrada != "") {
        try {
          int.parse(_entrada);

          print("\nNome é um valor numérico: favor digitar um valor válido.");
        } catch(err) {
          nome = _entrada;
          _dadoCorreto = true;
        }
      } else {
        print("\nNome está em branco: favor digitar um valor válido.");
      }
    }
    _dadoCorreto = false;

    return nome;
  }

  double getPesoApresentacao() {
    double peso = 0.0;

    while (!_dadoCorreto) {
      stdout.write("\nDigite seu peso (use . para separar os inteiros dos decimais):");
      _entrada = stdin.readLineSync().toString().trim();

      if (_entrada != null) {
        try {
          peso = double.parse(_entrada);

          if (peso <= 0.0) {
            print("\nPeso é um valor menor ou igual a zero: favor digitar um valor válido.");
            peso = 0.0;
          } else {
            _dadoCorreto = true;
          }
        } catch (err) {
          print("\nPeso não é um número: favor digitar um valor válido.");
        }
      } else {
        print("\nPeso está em branco: favor digitar um valor válido.");
      }
    }
    _dadoCorreto = false;

    return peso;
  }

  double getAlturaApresentacao() {
    double altura = 0.0;

    while (!_dadoCorreto) {
      stdout.write("Digite seu altura (use . para separar os inteiros dos decimais):");
      _entrada = stdin.readLineSync().toString().trim();

      if (_entrada != null) {
        try {
          altura = double.parse(_entrada);

          if (altura <= 0.0) {
            print("\nPeso é um valor menor ou igual a zero: favor digitar um valor válido.");
            altura = 0.0;
          } else {
            _dadoCorreto = true;
          }
        } catch (err) {
          print("\nPeso não é um número: favor digitar um valor válido.");
        }
      } else {
        print("\nPeso está em branco: favor digitar um valor válido.");
      }
    }
    _dadoCorreto = false;

    return altura;
  }
}