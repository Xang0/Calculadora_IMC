import 'dart:io';

class Apresentacao {
  bool _dadoCorreto = false;
  dynamic _entrada;
  final Stdin _stdin;
  final Stdout _stdout;

  Apresentacao({
    Stdin? stdin,
    Stdout? stdout,
  }) : _stdin = stdin ?? stdin!,
       _stdout = stdout ?? stdout!;

  void informacoesIniciais() {
    _stdout.write("Bem-vindo(a/e) à Calculadora de IMC\n\n");
    _stdout.write("O IMC - Índice de Massa Corporal é uma forma simples de identificar problemas relacionados ao peso, como obesidade ou desnutrição em crianças, adolescentes, adultos e idosos.\n");
    _stdout.write("Fórmula: IMC = Peso(Kg) / Altura²(metros)\n");
    _stdout.write("Segue a tabela com os valores e classificações:\n\n");

    _stdout.write("   |------------------------------------------|\n");
    _stdout.write("   |    IMC    |         Classificação        |\n");
    _stdout.write("   |-----------|------------------------------|\n");
    _stdout.write("   |    < 16   |  Magreza moderada            |\n");
    _stdout.write("   |-----------|------------------------------|\n");
    _stdout.write("   |  17 a 16  |  Magreza moderada            |\n");
    _stdout.write("   |-----------|------------------------------|\n");
    _stdout.write("   | 17 a 18.5 |  Magreza leve                |\n");
    _stdout.write("   |-----------|------------------------------|\n");
    _stdout.write("   | 18.5 a 25 |  Saudável                    |\n");
    _stdout.write("   |-----------|------------------------------|\n");
    _stdout.write("   |  25 a 30  |  Sobrepeso                   |\n");
    _stdout.write("   |-----------|------------------------------|\n");
    _stdout.write("   |  30 a 35  |  Obesidade Grau 1            |\n");
    _stdout.write("   |-----------|------------------------------|\n");
    _stdout.write("   |  35 a 40  |  Obesidade Grau 2 (severa)   |\n");
    _stdout.write("   |-----------|------------------------------|\n");
    _stdout.write("   |   >= 40   |  Obesidade Grau 3 (mórbida)  |\n");
    _stdout.write("   |------------------------------------------|\n\n");
  }

  String getNomeApresentacao() {
    String nome = "";

    while (!_dadoCorreto) {
      _stdout.write("Digite seu nome:");
      _entrada = _stdin.readLineSync().toString().trim();

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
    _stdout.write("|-----------------------------------------------------------------------|\n");
    _dadoCorreto = false;

    return nome;
  }

  double getPesoApresentacao() {
    double peso = 0.0;

    while (!_dadoCorreto) {
      _stdout.write("Digite seu peso (use . para separar os inteiros dos decimais):");
      _entrada = _stdin.readLineSync().toString().trim();

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
    _stdout.write("|-----------------------------------------------------------------------|\n");
    _dadoCorreto = false;

    return peso;
  }

  double getAlturaApresentacao() {
    double altura = 0.0;

    while (!_dadoCorreto) {
      _stdout.write("Digite sua altura (use . para separar os inteiros dos decimais):");
      _entrada = _stdin.readLineSync().toString().trim();

      if (_entrada != null) {
        try {
          altura = double.parse(_entrada);

          if (altura <= 0.0) {
            print("\nAltura é um valor menor ou igual a zero: favor digitar um valor válido.");
            altura = 0.0;
          } else {
            _dadoCorreto = true;
          }
        } catch (err) {
          print("\nAltura não é um número: favor digitar um valor válido.");
        }
      } else {
        print("\nAltura está em branco: favor digitar um valor válido.");
      }
    }
    _stdout.write("|-----------------------------------------------------------------------|\n");
    _dadoCorreto = false;

    return altura;
  }

  void apresentaResultado(String nome, double peso, double altura, double imc, String descricaoImc) {
    // Define column widths
    const nomeWidth = 15;
    const pesoWidth = 10;
    const alturaWidth = 10;
    const imcWidth = 10;
    const classificacaoWidth = 30;
    
    // Format numbers
    final pesoFormatado = peso.toStringAsFixed(2);
    final alturaFormatado = altura.toStringAsFixed(2);
    final imcFormatado = imc.toStringAsFixed(2);
    
    // Truncate strings if too long
    String truncate(String text, int maxLength) {
      return text.length <= maxLength 
          ? text 
          : '${text.substring(0, maxLength - 3)}...';
    }
    
    final nomeTruncado = truncate(nome, nomeWidth);
    final descricaoTruncada = truncate(descricaoImc, classificacaoWidth);
    
    // Build table
    final border = '+${'-' * (nomeWidth + 2)}+${'-' * (pesoWidth + 2)}+'
                   '${'-' * (alturaWidth + 2)}+${'-' * (imcWidth + 2)}+'
                   '${'-' * (classificacaoWidth + 2)}+';
    
    _stdout.write('$border\n');
    _stdout.write('| ${'Nome'.padRight(nomeWidth)} | ${'Peso'.padRight(pesoWidth)} | '
                  '${'Altura'.padRight(alturaWidth)} | ${'IMC'.padRight(imcWidth)} | '
                  '${'Classificação'.padRight(classificacaoWidth)} |\n');
    _stdout.write('$border\n');
    _stdout.write('| ${nomeTruncado.padRight(nomeWidth)} | ${pesoFormatado.padRight(pesoWidth)} | '
                  '${alturaFormatado.padRight(alturaWidth)} | ${imcFormatado.padRight(imcWidth)} | '
                  '${descricaoTruncada.padRight(classificacaoWidth)} |\n');
    _stdout.write('$border\n');

    _stdout.write("\nObrigado pela utilização do software! :) \n");
  }
}