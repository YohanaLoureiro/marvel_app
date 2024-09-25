import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToCharacterScreen();
  }

  void _navigateToCharacterScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    // Verifica se o widget ainda está montado antes de navegar
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/character');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00202020),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double logoSize = constraints.maxWidth * 0.5;
            return Image.asset(
              'assets/images/Marvel_Logo.png',
              width: logoSize,
              height: logoSize,
            );
          },
        ),
      ),
    );
  }
}
