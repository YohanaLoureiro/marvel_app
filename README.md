# marvel_app

Aplicação Flutter que consome a API da Marvel para exibir informações detalhadas de personagens, como nome e descrição.

## Índice

- [Descrição do Projeto](#descrição-do-projeto)
- [Funcionalidades](#funcionalidades)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Como Executar o Projeto](#como-executar-o-projeto)
- [Testes](#testes)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Descrição do Projeto

O Marvel App é um aplicativo que utiliza a API da Marvel para exibir uma lista de personagens, permitindo que os usuários busquem por personagens específicos e visualizem detalhes sobre eles. O aplicativo inclui uma tela de splash que aparece ao iniciar.

## Funcionalidades

- Tela de splash com animação de carregamento.
- Exibição de personagens em destaque em um carrossel.
- Campo de busca para encontrar personagens por nome.
- Listagem infinita de personagens, com carregamento automático ao rolar para baixo.
- Interface responsiva e intuitiva.

## Tecnologias Utilizadas

- [Flutter](https://flutter.dev/) - SDK para desenvolvimento de aplicativos móveis.
- [Dart](https://dart.dev/) - Linguagem de programação utilizada no projeto.
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc) - Gerenciamento de estado utilizando o padrão BLoC.
- [HTTP](https://pub.dev/packages/http) - Para realizar requisições de rede.
- [Provider](https://pub.dev/packages/provider) - Para gerenciamento de dependências.

## Como Executar o Projeto

### Pré-requisitos

- Certifique-se de que o Flutter está instalado. Se não, siga as instruções em [Flutter Installation](https://flutter.dev/docs/get-started/install).

### Passos

**Etapa 1: Obtenha suas chaves da API da Marvel**

1. Entre neste link: [Marvel Developer](https://developer.marvel.com/).
2. Faça o seu cadastro de acordo com as orientações passadas no próprio site.
3. Após isso, acesse "My Developer Account" ou "Minha conta de desenvolvedor" (caso seu site esteja traduzido).
4. Guarde suas chaves em um local seguro e não as compartilhe com ninguém (tanto sua chave pública quanto a privada).

**Etapa 2: Configuração do projeto**

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/marvel_app.git
   ```

2. Navegue até o diretório do projeto.

3. Abra um editor como o VSCode e altere o arquivo `character_remote_data_source.dart`, substituindo as seguintes linhas:

   ```dart
   final String publicKey = 'chave_publica'; // Substitua por sua chave pública
   final String privateKey = 'chave_privada'; // Substitua por sua chave privada
   ```

   com suas chaves obtidas na etapa anterior, ficando com algo parecido com:

   ```dart
   final String publicKey = '123a456b789h123g987'; // Substitua por sua chave pública
   final String privateKey = '123a456b789h123g987'; // Substitua por sua chave privada
   ```

4. Instale as dependências:

   ```bash
   flutter pub get
   ```

5. Certifique-se de que possui um emulador conectado.

6. Execute o aplicativo:

   ```bash
   flutter run
   ```

## Testes

Para executar os testes do projeto, utilize o seguinte comando:

```bash
flutter test
```

Os testes estão localizados na pasta `test/`. 

## Versões das Dependências

Flutter: ^3.5.3
cupertino_icons: ^1.0.8
flutter_modular: ^6.3.4
http: ^1.2.2
flutter_bloc: ^8.1.6
flutter_test: any (geralmente sem versão específica)
mockito: ^5.3.2
build_runner: ^2.3.3
flutter_lints: ^4.0.0
fake_async: ^1.2.0
dio: ^5.0.0
flutter_bloc (dev): ^8.0.0

## Contribuição

Contribuições são bem-vindas! Se você encontrar algum problema ou tiver sugestões, sinta-se à vontade para abrir uma issue ou enviar um pull request.

1. Faça um fork do projeto.
2. Crie uma nova branch (`git checkout -b minha-contribuicao`).
3. Faça suas alterações e faça commit (`git commit -m 'Adiciona nova funcionalidade'`).
4. Envie para a branch principal (`git push origin minha-contribuicao`).
5. Abra uma Pull Request.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
