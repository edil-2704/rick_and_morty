import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchTextController;
  const SearchWidget({
    super.key,
    required this.searchTextController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      decoration: InputDecoration(
        hintText: 'Найти персонажа',
        fillColor: Colors.grey.shade300,
        suffixIcon: Icon(Icons.filter_alt_outlined),
        prefixIcon: Icon(Icons.search_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
    );
  }
}
