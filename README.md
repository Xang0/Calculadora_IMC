# ⚖️ Calculadora de IMC (Dart CLI)

Este é um projeto simples desenvolvido em **Dart** que implementa uma **Calculadora de Índice de Massa Corporal (IMC)** executada diretamente no terminal (CLI).

O projeto aplica conceitos de Orientação a Objetos, separação de responsabilidades, validação de entrada de dados e testes unitários com Mocks.

## 📋 Funcionalidades

* **Cálculo de IMC:** Aplica a fórmula .
* **Classificação:** Categoriza o resultado desde "Magreza grave" até "Obesidade Grau 3" (baseado em tabelas padrão).
* **Validação de Entradas:** Impede que o usuário digite textos onde deveriam ser números, valores negativos ou nulos.
* **Interface Formatada:** Exibe os resultados em uma tabela alinhada no terminal.
* **Testes Unitários:** Cobertura de testes para a classe de apresentação simulando a entrada e saída de dados (`stdin`/`stdout`).

## 🚀 Estrutura do Projeto

O projeto está organizado da seguinte forma:

* **`calculadora_imc.dart`**: Arquivo principal (`main`). É o ponto de entrada da aplicação. Ele orquestra o fluxo: chama a apresentação, coleta dados, cria o objeto `Pessoa`, realiza o cálculo e exibe o resultado final.
* **`classes/pessoa.dart`**: Representa o modelo de dados do usuário. Contém os atributos encapsulados (`_nome`, `_peso`, `_altura`) e seus respectivos Getters e Setters.
* **`classes/apresentacao.dart`**: Responsável por toda a interação com o usuário (UI).
* Exibe mensagens e tabelas.
* Captura e **valida** os dados (`stdin`).
* Trata erros de conversão de tipos (ex: usuário digitar letras no campo de peso).
* Permite injeção de dependência de `stdin` e `stdout` para facilitar os testes.
* **`test/calculadora_imc_test.dart`**: Contém os testes unitários focados na classe `Apresentacao`. Utiliza o pacote `mockito` para simular a interação do usuário no terminal.

## 🛠️ Pré-requisitos

* [Dart SDK](https://dart.dev/get-dart) instalado.

## 📦 Dependências

Para que os testes funcionem corretamente, o projeto utiliza as seguintes dependências (que devem constar no seu `pubspec.yaml`):

* `test`
* `mockito`
* `build_runner` (para gerar os mocks)

Para instalar as dependências, execute:

```bash
dart pub get

```

## ▶️ Como Executar

Para rodar a calculadora, execute o arquivo principal através do terminal na raiz do projeto:

```bash
dart run calculadora_imc.dart

```

*(Ajuste o caminho caso o arquivo esteja dentro de uma pasta `bin/` ou `lib/`).*

### Exemplo de Uso

1. O sistema solicitará seu **Nome**.
2. Solicitará o **Peso** (use ponto para decimais, ex: `70.5`).
3. Solicitará a **Altura** (use ponto para decimais, ex: `1.75`).
4. O sistema exibirá uma tabela com os dados e a classificação do seu IMC.

## 🧪 Como Testar

O projeto possui testes robustos que verificam se a aplicação lida corretamente com entradas inválidas (textos, números negativos, vazios) antes de aceitar um valor válido.

Para rodar os testes:

1. Primeiro, gere as classes de Mock (necessário devido ao uso do `@GenerateNiceMocks`):

    ```bash
    dart run build_runner build

    ```

2. Execute os testes:

    ```bash
    dart test

    ```

**Nota:** Este projeto é fins educativos e demonstra práticas de código limpo e testes em Dart.
