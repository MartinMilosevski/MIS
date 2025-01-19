import 'package:flutter/material.dart';
import 'package:lab2_203086/models/Joke.dart';

class Favoritejoke extends StatefulWidget{

  final List<Joke> favoriteJokes;

  const Favoritejoke({super.key,required this.favoriteJokes});

  @override
  State<Favoritejoke> createState() => _Favoritejoke();

}

class _Favoritejoke extends State<Favoritejoke>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites Types"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.favoriteJokes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                color: Colors.amber,
                child: ListTile(
                  title:Text(widget.favoriteJokes[index].setup),
                  subtitle: Text(widget.favoriteJokes[index].punchline),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}