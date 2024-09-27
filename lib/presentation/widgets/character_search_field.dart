import 'package:flutter/material.dart';

class CharacterSearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const CharacterSearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: hintText,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
