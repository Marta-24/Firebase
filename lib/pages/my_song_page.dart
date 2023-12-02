import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';

class MySongPage extends StatelessWidget {
  const MySongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 34, 73), // Set background color
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(29, 34, 73, 100),
        centerTitle: true,
        title: const Text(
          'My Song',
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
          'My Songs Page',
          style: TextStyle(fontSize: 24, 
          color: Color.fromARGB(255, 176, 137, 0),),
        ),
      ),
    );
  }
}