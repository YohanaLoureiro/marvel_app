class CharacterModel {
  final int id;
  final String name;
  final String description;
  final String thumbnailPath;

  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailPath,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    final thumbnail = json['thumbnail'];
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? 'No description available',
      thumbnailPath: '${thumbnail['path']}.${thumbnail['extension']}',
    );
  }
}
