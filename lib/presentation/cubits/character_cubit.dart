import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/character_repository_impl.dart';
import '../../data/models/character_model.dart';

class CharacterCubit extends Cubit<List<CharacterModel>> {
  final CharacterRepository repository;
  int offset = 0;

  CharacterCubit(this.repository) : super([]);

  Future<void> fetchCharacters() async {
    try {
      final characters = await repository.getCharacters(offset);
      emit([...state, ...characters]);
      offset += characters.length;
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao buscar personagens: $e');
    }
  }
}
