import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'presentation/pages/splash_screen.dart';
import 'presentation/pages/character_screen.dart';
import 'data/data_sources/character_remote_data_source.dart';
import 'data/repositories/character_repository_impl.dart';
import 'presentation/cubits/character_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dio = Dio(BaseOptions(baseUrl: 'https://gateway.marvel.com/'));
  final remoteDataSource = CharacterRemoteDataSource(dio);
  final repository = CharacterRepository(remoteDataSource);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final CharacterRepository repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/character': (context) => BlocProvider(
              create: (context) => CharacterCubit(repository),
              child: const CharacterScreen(),
            ),
      },
    );
  }
}
