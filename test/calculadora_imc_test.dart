import 'dart:io';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:calculadora_imc/classes/apresentacao.dart';

@GenerateNiceMocks([MockSpec<Stdin>(), MockSpec<Stdout>()])
import 'calculadora_imc_test.mocks.dart';

void main() {
  late MockStdin mockStdin;
  late MockStdout mockStdout;
  late Apresentacao apresentacao;

  setUp(() {
    mockStdin = MockStdin();
    mockStdout = MockStdout();

    apresentacao = Apresentacao(
      stdin: mockStdin,
      stdout: mockStdout,
    );

    resetMockitoState();
  });

  group("Get nome", () {
    test('Deve aceitar um nome válido na primeira tentativa', () {
      // ARRANGE: Configure mock behavior
      when(mockStdin.readLineSync()).thenReturn('João Silva');
      // ACT: Call the method
      final resultado = apresentacao.getNomeApresentacao();
      // ASSERT: Verify the result and interactions
      expect(resultado, equals('João Silva'));
      // Verify mock interactions
      verify(mockStdout.write('Digite seu nome:')).called(1);
      verify(mockStdout.write('|-----------------------------------------------------------------------|\n')).called(1);
      verifyNever(mockStdout.write('\nNome está em branco: favor digitar um valor válido.\n'));
      verifyNever(mockStdout.write('\nNome é um valor numérico: favor digitar um valor válido.\n'));
    });

      // Test 2: Empty input, then valid input
      test('Deve rejeitar entrada vazia e depois aceitar um nome válido', () {
        // ARRANGE: First call returns empty, second returns valid name
        when(mockStdin.readLineSync())
          .thenReturnInOrder(['\n', 'Maria']);

        // ACT
        final resultado = apresentacao.getNomeApresentacao();
        
        // ASSERT
        expect(resultado, equals('Maria'));

        // Verify the sequence of interactions
        verifyInOrder([
          mockStdout.write('Digite seu nome:'),
          mockStdout.write('|-----------------------------------------------------------------------|\n'),
        ]);

        // Verify readLineSync was called twice
        verify(mockStdin.readLineSync()).called(2);
      });

      // Test 3: Numeric input, then valid input
    test('Deve rejeitar número e depois aceitar nome válido', () {
      // ARRANGE: First numeric, then valid
      when(mockStdin.readLineSync())
        .thenReturnInOrder(['278346237', 'Carlos']);

      // ACT
      final resultado = apresentacao.getNomeApresentacao();

      // ASSERT
      expect(resultado, equals('Carlos'));

      verifyInOrder([
        mockStdout.write('Digite seu nome:'),
        mockStdout.write('|-----------------------------------------------------------------------|\n'),
      ]);

      verify(mockStdin.readLineSync()).called(2);
    });
  });


  group("Get peso", () {
    test('Deve aceitar um peso válido na primeira tentativa', () {
      // ARRANGE: Configure mock behavior
      when(mockStdin.readLineSync()).thenReturn('89.5');

      // ACT: Call the method
      final resultado = apresentacao.getPesoApresentacao();

      // ASSERT: Verify the result and interactions
      expect(resultado, equals(89.5));

      // Verify mock interactions
      verify(mockStdout.write('Digite seu peso (use . para separar os inteiros dos decimais):')).called(1);
      verify(mockStdout.write('|-----------------------------------------------------------------------|\n')).called(1);
      verifyNever(mockStdout.write('\nPeso é um valor menor ou igual a zero: favor digitar um valor válido.'));
      verifyNever(mockStdout.write('\nPeso não é um número: favor digitar um valor válido.'));
      verifyNever(mockStdout.write('\nPeso está em branco: favor digitar um valor válido.'));
    });

    test('Deve rejeitar entrada menor ou igual a 0 e depois aceitar um peso válido', () {
      // ARRANGE: First call returns empty, second returns valid name
      when(mockStdin.readLineSync())
        .thenReturnInOrder(['0', '-78', '54.9']);

      // ACT
      final resultado = apresentacao.getPesoApresentacao();
        
      // ASSERT
      expect(resultado, equals(54.9));

      // Verify the sequence of interactions
      verifyInOrder([
        mockStdout.write('Digite seu peso (use . para separar os inteiros dos decimais):'),
        mockStdout.write('|-----------------------------------------------------------------------|\n'),
      ]);

      // Verify readLineSync was called twice
      verify(mockStdin.readLineSync()).called(3);
    });

    test('Deve rejeitar entrada não numérica e depois aceitar um peso válido', () {
      // ARRANGE: First numeric, then valid
      when(mockStdin.readLineSync())
        .thenReturnInOrder(['jasdhasg=[]', '73.2']);

      // ACT
      final resultado = apresentacao.getPesoApresentacao();

      // ASSERT
      expect(resultado, equals(73.2));

      verifyInOrder([
        mockStdout.write('Digite seu peso (use . para separar os inteiros dos decimais):'),
        mockStdout.write('|-----------------------------------------------------------------------|\n'),
      ]);

      verify(mockStdin.readLineSync()).called(2);
    });

    test('Deve rejeitar entrada nula e depois aceitar um peso válido', () {
      // ARRANGE: First numeric, then valid
      when(mockStdin.readLineSync())
        .thenReturnInOrder(['', '68.0']);

      // ACT
      final resultado = apresentacao.getPesoApresentacao();

      // ASSERT
      expect(resultado, equals(68.0));

      verifyInOrder([
        mockStdout.write('Digite seu peso (use . para separar os inteiros dos decimais):'),
        mockStdout.write('|-----------------------------------------------------------------------|\n'),
      ]);

      verify(mockStdin.readLineSync()).called(2);
    });
  });


  group("Get altura", () {
    test('Deve aceitar uma altura válida na primeira tentativa', () {
      // ARRANGE: Configure mock behavior
      when(mockStdin.readLineSync()).thenReturn('1.67');

      // ACT: Call the method
      final resultado = apresentacao.getAlturaApresentacao();

      // ASSERT: Verify the result and interactions
      expect(resultado, equals(1.67));

      // Verify mock interactions
      verify(mockStdout.write('Digite sua altura (use . para separar os inteiros dos decimais):')).called(1);
      verify(mockStdout.write('|-----------------------------------------------------------------------|\n')).called(1);
      verifyNever(mockStdout.write('\nAltura é um valor menor ou igual a zero: favor digitar um valor válido.'));
      verifyNever(mockStdout.write('\nAltura não é um número: favor digitar um valor válido.'));
      verifyNever(mockStdout.write('\nAltura está em branco: favor digitar um valor válido.'));
    });

    test('Deve rejeitar entrada menor ou igual a 0 e depois aceitar uma altura válido', () {
      // ARRANGE: First call returns empty, second returns valid name
      when(mockStdin.readLineSync())
        .thenReturnInOrder(['0', '-78', '1.89']);

      // ACT
      final resultado = apresentacao.getAlturaApresentacao();
        
      // ASSERT
      expect(resultado, equals(1.89));

      // Verify the sequence of interactions
      verifyInOrder([
        mockStdout.write('Digite sua altura (use . para separar os inteiros dos decimais):'),
        mockStdout.write('|-----------------------------------------------------------------------|\n'),
      ]);

      // Verify readLineSync was called twice
      verify(mockStdin.readLineSync()).called(3);
    });

    test('Deve rejeitar entrada não numérica e depois aceitar uma altura válido', () {
      // ARRANGE: First numeric, then valid
      when(mockStdin.readLineSync())
        .thenReturnInOrder(['jasdhasg=[]', '1.73']);

      // ACT
      final resultado = apresentacao.getAlturaApresentacao();

      // ASSERT
      expect(resultado, equals(1.73));

      verifyInOrder([
        mockStdout.write('Digite sua altura (use . para separar os inteiros dos decimais):'),
        mockStdout.write('|-----------------------------------------------------------------------|\n'),
      ]);

      verify(mockStdin.readLineSync()).called(2);
    });

    test('Deve rejeitar entrada nula e depois aceitar uma altura válido', () {
      // ARRANGE: First numeric, then valid
      when(mockStdin.readLineSync())
        .thenReturnInOrder(['', '1.54']);

      // ACT
      final resultado = apresentacao.getAlturaApresentacao();

      // ASSERT
      expect(resultado, equals(1.54));

      verifyInOrder([
        mockStdout.write('Digite sua altura (use . para separar os inteiros dos decimais):'),
        mockStdout.write('|-----------------------------------------------------------------------|\n'),
      ]);

      verify(mockStdin.readLineSync()).called(2);
    });
  });
}
