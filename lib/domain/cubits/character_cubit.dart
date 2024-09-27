import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/character_repository_impl.dart';
import '../../data/models/character_model.dart';

class CharacterCubit extends Cubit<List<CharacterModel>> {
  final CharacterRepository repository;
  int offset = 0;
  String lastQuery = '';
  bool hasMore = true;
  CharacterCubit(this.repository) : super([]);

  Future<void> fetchCharacters({String name = '', bool reset = false}) async {
    try {
      if (reset || name != lastQuery) {
        offset = 0;
        hasMore = true;
        emit([]);
      }
      if (!hasMore) return;

      final characters = await repository.getCharacters(offset, name: name);

      if (characters.isEmpty) {
        hasMore = false;
      } else {
        // ignore: prefer_collection_literals
        final updatedList = [...state, ...characters].toSet().toList();
        emit(updatedList);
        offset += characters.length;
      }

      lastQuery = name;
    } catch (e) {
      print('Erro ao buscar personagens: $e');
    }
  }

  void resetCharacters() {
    lastQuery = '';
    offset = 0;
    hasMore = true;
    emit([]);
    fetchCharacters();
  }
}
