import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/character_cubit.dart';
import '../../data/models/character_model.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late final CharacterCubit characterCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    characterCubit = context.read<CharacterCubit>();
    characterCubit.fetchCharacters();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        characterCubit.fetchCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personagens')),
      body: BlocBuilder<CharacterCubit, List<CharacterModel>>(
        builder: (context, characters) {
          // ignore: avoid_print
          print('Characters: ${characters.length}');
          if (characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            controller: _scrollController,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return ListTile(
                title: Text(character.name),
                subtitle: Text(character.description),
                leading: character.thumbnailPath.isNotEmpty
                    ? Image.network(character.thumbnailPath)
                    : null,
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
