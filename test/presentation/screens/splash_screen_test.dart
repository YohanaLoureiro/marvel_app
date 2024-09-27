import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/presentation/screens/splash_screen.dart';

void main() {
  testWidgets('SplashScreen displays logo and navigates',
      (WidgetTester tester) async {
    // Build the SplashScreen widget.
    await tester.pumpWidget(MaterialApp(
      home: const SplashScreen(),
      routes: {
        '/character': (context) => Container(), // Mock da tela de destino
      },
    ));

    // Verifica se o logo está presente.
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Bem-vindo ao App'),
        findsNothing); // Ajuste conforme necessário.

    // Simula a passagem do tempo para a navegação.
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Verifica se a navegação ocorreu para a tela de personagem.
    expect(find.byType(Container),
        findsOneWidget); // Verifica se a tela mockada foi carregada.
  });
}
