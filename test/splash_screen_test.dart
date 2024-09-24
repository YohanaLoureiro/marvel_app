import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/screens/splash_screen.dart';

void main() {
  testWidgets('SplashScreen displays the logo and navigates to HomeScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const Scaffold(body: Text('Home Screen')),
      },
    ));

    // Verifica se a logo está sendo exibida
    expect(find.byType(Image), findsOneWidget);

    // Verifica se o fundo da tela é a cor correta
    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, const Color(0x00202020));

    // Aguarda 3 segundos para simular a navegação
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Verifica se navega para a HomeScreen
    expect(find.text('Home Screen'), findsOneWidget);
  });
}
