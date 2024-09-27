import 'package:flutter/material.dart';
import '../../data/models/character_model.dart';
import '../screens/character_detail_screen.dart';

class FeaturedCharactersCarousel extends StatelessWidget {
  final List<CharacterModel> characters;

  const FeaturedCharactersCarousel({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    if (characters.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: characters.length,
        controller: PageController(
          initialPage: 0,
          viewportFraction: 0.55,
        ),
        itemBuilder: (context, index) {
          final character = characters[index];
          return Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              left: 8.0,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CharacterDetailScreen(character: character),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(character.thumbnailPath),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    character.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
