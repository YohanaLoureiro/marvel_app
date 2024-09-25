import 'package:dio/dio.dart';
import '../models/character_model.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class CharacterRemoteDataSource {
  final Dio dio;
  final String publicKey = 'chave_pública'; // Substitua por sua chave pública
  final String privateKey = 'chave_privada'; // Substitua por sua chave privada

  CharacterRemoteDataSource(this.dio);

  // Função para gerar o hash MD5
  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future<List<CharacterModel>> fetchCharacters(int offset) async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = generateMd5('$timestamp$privateKey$publicKey');

    try {
      final response = await dio.get(
        '/v1/public/characters',
        queryParameters: {
          'apikey': publicKey,
          'ts': timestamp,
          'hash': hash,
          'offset': offset,
          'limit': 10,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['data']['results'] as List;
        return data.map((e) => CharacterModel.fromJson(e)).toList();
      } else {
        throw Exception('Erro ao buscar personagens: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar personagens: $e');
      rethrow;
    }
  }
}
