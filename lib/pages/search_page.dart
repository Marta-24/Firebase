import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(29, 34, 73, 100),
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 176, 137, 0),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 176, 137, 0),
        ),
      ),
      body: const Center(
        child: Text(
          'Search Page',
          style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 176, 137, 0)),
        ),
      ),
    );
  }
}