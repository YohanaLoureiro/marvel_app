import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/cubits/character_cubit.dart';
import '../../data/models/character_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/featured_characters_carousel.dart';
import '../widgets/character_card.dart';
import '../widgets/character_search_field.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late final CharacterCubit characterCubit;
  final ScrollController _scrollController = ScrollController();
  String searchQuery = '';
  bool isLoadingMore = false;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
    characterCubit = context.read<CharacterCubit>();
    characterCubit.fetchCharacters();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoadingMore &&
          hasMoreData) {
        setState(() {
          isLoadingMore = true;
        });
        characterCubit.fetchCharacters(name: searchQuery).then((_) {
          setState(() {
            isLoadingMore = false;
            final currentState = characterCubit.state;
            if (currentState.isEmpty) {
              hasMoreData = false;
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'FEATURED CHARACTERS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<CharacterCubit, List<CharacterModel>>(
              builder: (context, characters) {
                if (characters.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                return FeaturedCharactersCarousel(
                  characters: characters,
                );
              },
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'MARVEL CHARACTERS LIST',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            CharacterSearchField(
              hintText: 'Search characters',
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                  hasMoreData = true;
                });

                if (query.isEmpty) {
                  characterCubit.resetCharacters();
                  characterCubit.fetchCharacters();
                } else {
                  characterCubit.fetchCharacters(name: query, reset: true);
                }
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<CharacterCubit, List<CharacterModel>>(
              builder: (context, characters) {
                if (characters.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }

                final filteredCharacters = characters.where((character) {
                  return character.name
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase());
                }).toList();

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: filteredCharacters.length,
                      itemBuilder: (context, index) {
                        final character = filteredCharacters[index];
                        return CharacterCard(character: character);
                      },
                    ),
                    if (isLoadingMore && hasMoreData)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                  ]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
