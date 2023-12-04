import 'package:flutter/material.dart';

class MySongPage extends StatelessWidget {
  const MySongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 34, 73),
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
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                height: 80,
                color: const Color.fromARGB(255, 29, 34, 73),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://example.com/album_cover.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Song Name $index',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 176, 137, 0),
                            ),
                          ),
                          Text(
                            'Artist Name $index',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 176, 137, 0),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.play_circle_filled,
                          color: Color.fromARGB(255, 247, 68, 78)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 53, 61, 131),
                thickness: 1,
                height: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
