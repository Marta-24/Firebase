import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(29, 34, 73, 100),
        centerTitle: true,
        title: const Text(
          'More',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 232, 208, 122),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 232, 208, 122),
        ),
      ),
      body: const Center(
        child: Text(
          'More Page',
          style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 232, 208, 122),),
        ),
      ),
    );
  }
}