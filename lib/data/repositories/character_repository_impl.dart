import '../data_sources/character_remote_data_source.dart';
import '../models/character_model.dart';

class CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepository(this.remoteDataSource);

  Future<List<CharacterModel>> getCharacters(int offset) {
    return remoteDataSource.fetchCharacters(offset);
  }
}
